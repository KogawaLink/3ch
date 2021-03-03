Rails.application.routes.draw do
  get 'tops/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  get 'tops/thread'
  
  get 'tops/newthread'
end
