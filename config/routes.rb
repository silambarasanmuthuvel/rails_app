Rails.application.routes.draw do

  devise_for :users

  resources :tags
  resources :topics do
    collection do
      get :form_display , controller: :posts
    end

    resources :posts do
      member do
        get :readstatus
      end
      resources :comments
      resources :ratings
    end
  end

  get "/posts", to: 'posts#index'
  root "topics#index"
  # get '/topics/:topic_id/posts/:id/readstatus' => 'posts#readstatus'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #header for sign in
  get "/user", to: "application#authenticate"

  # resources :device , only: [:device_detect] , path ""do
  #   collection do
  #     get :device_detect , path: '/device'
  #   end
  get "/device", to: "device#device_detect"
end
