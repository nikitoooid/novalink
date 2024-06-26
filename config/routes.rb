Rails.application.routes.draw do
  devise_for :users
  root 'application#index'

  resources :links, except: :show
  get '/:slug', to: 'links#redirect', as: :slug_redirect
end
