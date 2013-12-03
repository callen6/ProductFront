ProductFront::Application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :show]
  post '/products/add_to_cart', to: 'line_items#create', as: 'new_line_item'
end
