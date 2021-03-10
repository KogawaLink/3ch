Rails.application.routes.draw do
  get 'searchs/new'
  get 'newthreads/new'
  post 'newthreads/new'
  get 'tops/index'
  post 'tops/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  get 'tops/post'
  
  get 'tops/newthread'
  
  get 'concerns/search'
  get '/newthreads/new'
end
