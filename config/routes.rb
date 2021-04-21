Rails.application.routes.draw do
  get 'searchs/new'
  get 'tops/index'
  post 'tops/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  get 'newthread/:id/posts', to: 'posts#index', as: 'posts'
  
  get 'newthreads/:id/delete', to: 'newthreads#delete'
  delete 'newthreads/:id/delete', to: 'newthreads#destroy'
  
  get 'newthread/:id/searchs', to: 'searchs#search', as: 'searchs'
  
  get 'concerns/search'
  resources :newthreads do
    resources :posts, only: [:create]
  end
  
end
