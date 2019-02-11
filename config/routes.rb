Rails.application.routes.draw do

  devise_for :users
  resources :tags
  resources :topics do
    resources :posts do
      resources :comments
      resources :ratings
    end
  end
  get "/posts", to: 'posts#index'
  root "topics#index"
  get '/topics/:topic_id/posts/:id/readstatus' => 'posts#readstatus'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/user", to: "application#authenticate"

end
