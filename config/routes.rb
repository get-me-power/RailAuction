# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get "/" => "home#top"
  get 'user/index'
  get 'user/new'
  get 'user/login' => 'user#login_form'
  get 'user/:id' => 'user#show'
  get 'user/:id/edit' => 'user#edit'
  patch 'user/:id/update' => 'user#update'
  post 'user/:id/destroy' => 'user#destroy'

  post 'user/create'
  post 'user/logout'

  get 'home/top'
  get 'home/about'

  get 'posts/index'
  get 'posts/new'

  get 'posts/:id' => "posts#show"
  get 'posts/:id/edit' => 'posts#edit'
  patch 'posts/:id/update' => 'posts#update'
  post "posts/:id/destroy" => "posts#destroy"

  post 'posts/create'
  post 'user/login' => 'user#login'

  resources :user do
    member do
      # /users/:id/ ...
      get :following, :followers
      # GET /users/1/following => following action
      # GET /users/1/followers => followers action
    end
  end

  resources :relationships, only: [:create, :destroy]

end
