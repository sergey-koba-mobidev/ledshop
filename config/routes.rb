Rails.application.routes.draw do
  root to: 'index#show'
  get 'contacts', to: 'index#contacts'

  mount Shoppe::Engine => "/shoppe"
end
