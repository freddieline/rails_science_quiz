Rails.application.routes.draw do
  get 'welcome/index'

  resources :quiz

  root 'welcome#index'
end
