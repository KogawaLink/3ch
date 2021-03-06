Rails.application.routes.draw do
  get 'searchs/new'
  get 'tops/index'
  post 'tops/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  get 'newthread/:id/posts', to: 'posts#index', as: 'posts'
  
  get 'newthreads/delete/:id', to: 'newthreads#delete', as: 'newthread_delete'
  delete 'newthreads/delete/:id', to: 'newthreads#destroy', as: 'newthread_destroy'
  
  get 'newthreads/search', to: 'newthreads#search'
  get 'tops/author'
  
  get 'concerns/search'
  resources :newthreads do
    resources :posts, only: [:create]
  end
  
  get '/sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/sitemaps/sitemap.xml.gz")
end
