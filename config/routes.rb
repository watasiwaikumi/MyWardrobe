Rails.application.routes.draw do

  resources :events
  get 'searches/search'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :post_images, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  get "search", to: "users#search"
  end
  
  get 'mypage', to: "users#show"
   resources :wardrobes do
   resource :favorites
   resources :wardrobe_comments
  end
  get '/search', to: 'searches#search'
  # get "events", to: "users#index"
  # post "events", to: "events#create"

end
