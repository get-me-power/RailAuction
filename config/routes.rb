# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'user/edit'
  get 'user/new'
  get 'user/login' => 'user#login_form'

  post 'user/create'

  get 'home/top'
  get 'home/about'

  get 'posts/index'
  get 'posts/new'

  get "posts/index/:post_id" => "posts#data"
  get 'posts/index/:post_id/edit' => "posts#edit"

  post 'posts/create'

  post 'user/login' => 'user#login'
end
