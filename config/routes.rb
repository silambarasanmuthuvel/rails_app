Rails.application.routes.draw do
 
  resources :topics do
 	resources :posts do
 		resources :comments
 	end

  end
  get "/posts", to: 'posts#index'
root "topics#index"
get '/topics/:id' => 'topics#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
