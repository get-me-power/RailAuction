Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/top'
  get 'home/about'

  get 'posts/index'
end
