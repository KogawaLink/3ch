Rails.application.routes.draw do
  get 'searchs/new'
  get 'tops/index'
  post 'tops/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  get 'posts/:id/posts', to: 'tops#posts', as: 'posts/posts'
  
  get 'tops/newthread'
  
  get 'concerns/search'
  resources 'newthreads'
  
end
