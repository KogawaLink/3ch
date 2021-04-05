Rails.application.routes.draw do
  get 'searchs/new'
  get 'tops/index'
  post 'tops/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  get 'newthread/:id/posts', to: 'posts#index', as: 'posts'
  
  get 'tops/newthread'
  
  get 'concerns/search'
  resources :newthreads do
    resources :posts, only: [:create]
  end
  
  
end
