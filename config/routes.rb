
Rails.application.routes.draw do
  scope module: :public do
  root to: 'homes#top'
   end




  namespace :admin do
    resources :customers, only: [:show, :index, :edit, :update, :new]
    # get 'genres/index'
    # get 'genres/edit'
    resources :genres, only: [:edit,:index,:create,:update]
    resources :items, only: [:new, :create, :edit, :update, :show,:index]
    resources :orders, only: [:show, :update]

    get 'homes/top'
   end


  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'

    get 'orders/index'
    get 'orders/new'
    get 'orders/show'
    get 'orders/complete'

    get 'cart_items/index'

    get 'customers/show'
    get 'customers/edit'
    get 'customers/index'
   end
  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end