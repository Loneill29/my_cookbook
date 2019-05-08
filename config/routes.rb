Rails.application.routes.draw do

  resources :categories do
    resources :recipes
  end 

  devise_for :users

  get 'welcome/index'

  root 'welcome#index'
end
