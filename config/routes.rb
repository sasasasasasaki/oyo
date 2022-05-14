
Rails.application.routes.draw do
  scope module: :public do
  root to: 'homes#top'
  end
  
  namespace :admin do
    get 'orders/show'

    #get 'customers/index'
    #get 'customers/edit'
    #get 'customers/show'
    resource :customers, only: [:new, :create, :edit, :update, :destroy]

    get 'genres/index'
    get 'genres/edit'

    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'

    get 'homes/top'
  end
  
  
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/index'
    get 'orders/new'
    get 'orders/show'
    get 'orders/complete'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
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
  resource :items, only: [:new, :create, :edit, :update, :destroy]
end
  
  

