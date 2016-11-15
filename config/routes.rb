Rails.application.routes.draw do
  get 'welcome/index'

  resources :quiz do 
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

  get '/quiz/:quiz_id/answers', to: 'answers#do', as: :do

  get '/quiz/:quiz_id/answers', to: 'answers#submit', as: :submit

  root 'welcome#index'
end
