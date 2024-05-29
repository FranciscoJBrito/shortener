Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'links#index', as: :authenticated_root
  end
  root 'home#index'
  resources :links, only: %i[show destroy create index new]
  get '/:lookup_code' => 'links#show'
end
