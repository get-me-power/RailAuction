# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'user/index'
  get 'user/new'
  get 'user/login' => 'user#login_form'
  get 'user/:id' => 'user#show'
  get 'user/:id/edit' => 'user#edit'
  patch 'user/:id/update' => 'user#update'

  post 'user/create'
  post 'user/logout'

  get 'home/top'
  get 'home/about'

  get 'posts/index'
  get 'posts/new'

  #get "posts/index/:post_id/show" => "posts#show"
  get 'posts/:id' => "posts#show"
  #get 'posts/index/:post_id/edit' => "posts#edit"

  post 'posts/create'
  post 'user/login' => 'user#login'
  get "/" => "home#top"

end
