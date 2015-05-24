Rails.application.routes.draw do
  root to: 'index#show'
  get 'contacts', to: 'index#contacts'
  get 'news', to: 'news#index'
  get 'about', to: 'index#about'
  get 'delivery', to: 'index#delivery'

  mount Shoppe::Engine => "/shoppe"
end
