# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'user/edit'
  get 'user/new'
  get 'user/login'

  get 'home/top'
  get 'home/about'

  get 'posts/edit'
  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
end
