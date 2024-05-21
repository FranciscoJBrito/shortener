Rails.application.routes.draw do
  resources :links, only: %i[show destroy create index new]
  root 'links#index'
  get '/:lookup_code' => 'links#show'
end
