Rails.application.routes.draw do

  resources :recipes

  devise_for :users

  get 'welcome/index'

  root 'welcome#index'
end
