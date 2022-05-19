Rails.application.routes.draw do
  get 'deliveries/index'
  get 'deliveries/edit'
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/thanx'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/quit'
    get 'customers/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
