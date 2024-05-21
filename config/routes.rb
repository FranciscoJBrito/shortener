Rails.application.routes.draw do
  resources :links, only: %i[show destroy create index new]
  root 'links#index'
end
