Rails.application.routes.draw do
  root to: 'index#show'

  mount Shoppe::Engine => "/shoppe"
end
