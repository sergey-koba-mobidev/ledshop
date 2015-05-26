namespace :ledlife do
  desc "Import stuff from ledlife"
  task :import => :environment do
    require 'nokogiri'
    require 'open-uri'

    class String
      def pretty
        self.colorize(color: :light_green, background: :default)
      end
    end

    def import_product_properties(product, product_doc)
      product_doc.css("#product-attribute-specs-table li").each do |prop_li|
        name = prop_li.at_css('.characteristics_title').text
        prop = Spree::Property.find_or_create_by!(name: name, presentation: name)
        product_prop = Spree::ProductProperty.new
        product_prop.product = product
        product_prop.property = prop
        product_prop.value = prop_li.at_css('.data').text
        product_prop.save!
      end
    end

    def import_product_options(product, product_doc)
      script_text = product_doc.css('#product-options-wrapper script').first.text
      options_json = script_text.match('Product\.Config\((.*)\);').captures.first
      options = JSON.parse options_json
      all_values = Hash.new
      options["attributes"].each do |key, attribute|
        option_type = Spree::OptionType.find_or_create_by!(name: attribute["code"], presentation: attribute["label"])
        product.option_types << option_type
        attribute["options"].each do |value|
          option_value = Spree::OptionValue.find_or_create_by!(name: value["label"], presentation: value["label"], option_type_id: option_type.id)
          all_values[value["id"]] = Hash.new
          all_values[value["id"]]["old_option"] = value
          all_values[value["id"]]["new_option"] = option_value
        end
      end

      # Variants
      options["productsSku"].each do |key, var|
        price = 0
        var["attributes"].each do |atr_id, val_id|
          price += all_values[val_id]["old_option"]["price"].to_f
        end
        variant = Spree::Variant.find_by_sku(var["sku"])
        if variant.nil?
          variant = Spree::Variant.create!(
              product_id: product.id,
              sku: var["sku"],
              price: price
          )
          var["attributes"].each do |atr_id, val_id|
            variant.option_values << all_values[val_id]["new_option"]
          end
        end
      end
    end

    def import_images(product, product_doc)
      product_doc.css("#prod-thumbnails li a").each do |img_link|
        product.images.create!(attachment: URI.parse(img_link["href"]))
      end
    end

    def import_product(taxon, product_url)
      doc = Nokogiri::HTML(open(product_url))
      name = doc.at_css("h1").text
      product = Spree::Product.find_by_slug(product_url.split('/').last.gsub('.html', ''))
      if product.nil?
        product = Spree::Product.new
        product.assign_attributes(
            name: name,
            description: doc.at_css(".description").content,
            available_on: Time.now,
            slug: product_url.split('/').last.gsub('.html', ''),
            shipping_category_id: 1
        )
        product.master.price = doc.at_css(".price").text.match('(\d+[,.]\d+)').captures.first.gsub(",", ".").to_f
        product.save!
      end
      product.taxons << taxon
      import_product_options product, doc
      import_product_properties product, doc
      import_images product, doc if product.images.count == 0
      puts "Imported product: " + name.pretty + ' ' + product_url
    end

    def import_products(taxon, category_doc)
      page = 0
      loop do
        page += 1

        category_doc.css(".product-name a").each do |product_link|
          import_product taxon, product_link["href"]
        end

        puts "Imported products from " + taxon.name.pretty + ' page ' + page.to_s.pretty
        next_page_link = category_doc.at_css('.next.i-next')
        break if next_page_link.nil?
        category_doc = Nokogiri::HTML(open(next_page_link['href']))
      end
    end

    def import_categories
      url = "http://ledlife.com.ua"
      doc = Nokogiri::HTML(open(url))
      doc.css("#mega-menu ul li a").each do |category_link|
        unless category_link["class"]=="all-btn"
          category_url = category_link['href']
          name = category_link.at_css("span").text
          category_doc = Nokogiri::HTML(open(category_url))
          category = Spree::Taxonomy.create!(
              name: name
          )
          taxon = category.root
          taxon.update_attributes!(
              description: category_doc.at_css('.category-description').content,
              permalink: category_link["href"].split('/').last.gsub('.html', '')
          )
          puts "Imported category: " + name.pretty + ' ' + category_url
          import_products taxon, category_doc
        end
      end
    end

    puts "Started import at:" + Time.now.to_s
    Spree::Taxonomy.unscoped.destroy_all
    Spree::OptionType.unscoped.destroy_all
    Spree::Property.unscoped.destroy_all
    Spree::Image.unscoped.destroy_all
    Spree::Product.all.map{ |p| p.really_destroy! }
    import_categories
  end
end
