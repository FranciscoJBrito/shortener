Rails.application.routes.draw do
  root 'home#index'
  resources :links, only: %i[show destroy create index new]
  get '/:lookup_code' => 'links#show'
end

