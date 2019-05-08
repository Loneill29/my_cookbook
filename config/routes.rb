Rails.application.routes.draw do

  resources :categories do
    resources :recipes, except: [:index]
  end

  get 'recipes/index'
resources :recipes
  devise_for :users

  get 'welcome/index'

  root 'welcome#index'
end
