Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admins/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "publics/registrations",
    sessions: 'publics/sessions'
  }


  namespace :admin do
    root to: "admin/homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  namespace :public do
    root to: "homes#top"
    get "about" => "homes#about"

    resources :customers, only: [:edit, :update] do
      get "customers/my_page" => "customers#show"
      collection do
        get "quit"
        patch "out"
      end
    end

    resources :items, only: [:index, :show]

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post "confirm"
        get "thanx"
      end
    end
  end

  resources :cart_items, only: [:index, :update, :create, :destroy] do
    collection do
      delete "all_delete"
    end
  end

  resources :deliveries, only: [:index, :create, :destroy, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end