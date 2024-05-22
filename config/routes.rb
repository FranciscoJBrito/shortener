Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :links, only: %i[show destroy create index new]
  get '/:lookup_code' => 'links#show'
end

