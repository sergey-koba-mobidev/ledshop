# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'

require 'spree/product_filters'

Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  config.checkout_zone = 'Ukraine'
end

Spree.user_class = "Spree::User"

Spree::Taxon.class_eval do
  # indicate which filters should be used for a taxon
  # this method should be customized to your own site
  def applicable_filters
    fs = []
    #fs << Spree::Core::ProductFilters.taxons_below(self) unless self.root?
    fs << Spree::Core::ProductFilters.simple_scopes if Spree::Core::ProductFilters.respond_to?(:simple_scopes)
    #fs << Spree::Core::ProductFilters.price_filter if Spree::Core::ProductFilters.respond_to?(:price_filter)
    #fs << Spree::Core::ProductFilters.brand_filter if Spree::Core::ProductFilters.respond_to?(:brand_filter)
    fs
  end
end