Rails.application.routes.draw do

  resources :recipes do
    resources :ingredients
  end

  devise_for :users

  get 'welcome/index'

  root 'welcome#index'
end
