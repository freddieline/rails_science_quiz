Rails.application.routes.draw do
  get 'welcome/index'

  resources :quiz do 
    resources :results
    resources :questions do
      resources :answers
    end
  end

  resources :quiz do
    member do
      get 'do'
      put 'submit'
    end
  end


  root 'welcome#index'
end
