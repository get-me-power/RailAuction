Rails.application.routes.draw do
  get 'user/new'
  get 'user/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/top'
  get 'home/about'

  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
end
