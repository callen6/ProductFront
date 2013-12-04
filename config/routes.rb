ProductFront::Application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :show]
  post '/products/add_to_cart', to: 'line_items#create', as: 'new_line_item'
  get '/cart', to:  'line_items#index', as: 'cart'
  delete '/cart', to: "line_items#delete", as: 'remove_item_from_cart'
  post '/cart/checkout', to: "orders#create", as: "new_order"
  get '/order/history', to: "orders#index", as: "order_history"
  get '/order/history/show/:id', to: "orders#show", as: "order"
  get '/popular', to: 'line_items#show', as: "popular"
end
