Rails.application.routes.draw do

  get 'searches/search'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :post_images, only: [:new, :create, :index, :show, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  get "search", to: "users#search"
  end
   resources :wardrobes do
   resource :favorites
   resources :wardrobe_comments
  end
  get '/search', to: 'searches#search'
  get "calendars", to: "users#index"
  post "calendars", to: "calendars#create"

end
