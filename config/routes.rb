Rails.application.routes.draw do
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/'

  root to: 'index#show'

  #
  # Info pages
  #
  get 'contacts', to: 'index#contacts'
  get 'news', to: 'news#index'
  get 'about', to: 'index#about'
  get 'delivery', to: 'index#delivery'

  #
  # Product browising
  #
  #get 'products' => 'products#categories', :as => 'catalogue'
  #get 'products/filter' => 'products#filter', :as => 'product_filter'
  #get 'products/:category_id' => 'products#index', :as => 'products'
  #get 'products/:category_id/:product_id' => 'products#show', :as => 'product'
  #post 'products/:category_id/:product_id/buy' => 'products#add_to_basket', :as => 'buy_product'
end
