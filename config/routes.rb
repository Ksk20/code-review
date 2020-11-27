Rails.application.routes.draw do
  devise_for :customers, controllers: {
  	sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
 #上はデバイスのコントローラのカスタマイズ

  get '/' => "customers/homes#top", as: 'home'
  get 'homes/about' => "customers/homes#about",as: 'about'
  get 'homes/how_to_use' => "customers/homes#how_to_use",as: 'how_to_use'

  scope module: 'customers' do
    resources :customers, only:[:edit, :update, :destroy, :show]
    get 'customer/destruction'=> "customers#destruction"
    resources :notifications, only: [:index, :destroy]
    resources :books, only: [:index,:destroy]
    resources :people, only:[:index, :create, :show, :edit, :update, :new] do
      resources :portraits, only:[:index, :create, :destroy]
      resources :creations, only:[:new,:index, :create, :edit, :update, :destroy]
      resources :books, only:[:new,  :create, :edit, :update, :destroy] do
        resources :tags, only:[:destroy]
        resources :favorites, only: [:create, :destroy]
      end
    end
  end

    devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :people, only: [:index, :destroy]
    resources :tags, only: [:index, :destroy, :edit, :update]
  end
end
