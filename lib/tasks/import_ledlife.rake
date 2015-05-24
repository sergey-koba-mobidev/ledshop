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

    def import_product(product_url)
      #doc = Nokogiri::HTML(open(product_url))

    end

    def import_products(category, category_doc)
      page = 0
      loop do
        page += 1

        category_doc.css(".product-name a").each do |product_link|
          import_product product_link["href"]
        end

        puts "Imported products from " + category.name.pretty + ' page ' + page.to_s.pretty
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
          category = Spree::Taxonomy.create(
              name: name,
          )
          taxon = category.root
          taxon.update_attributes(
              description: category_doc.at_css('.category-description').content,
              permalink: category_link["href"].split('/').last.gsub('.html', '')
          )
          puts "Imported category: " + name.pretty + ' ' + category_url
          import_products category, category_doc
        end
      end
    end

    puts "Started import at:" + Time.now.to_s

    Spree::Taxonomy.destroy_all
    import_categories
  end
end
