Rails.application.routes.draw do
  devise_for :customers, controllers: {
  	sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }

  get '/' => "customers/homes#top", as: 'home'
  get 'homes/about' => "customers/homes#about",as: 'about'
  get 'homes/how_to_use' => "customers/homes#how_to_use",as: 'how_to_use'

  scope module: 'customers' do
    resources :customers, only:[:edit, :update, :destroy, :show]
    resources :people, only:[:index, :create, :show, :edit, :update, :new] do
      resources :portraits, only:[:index, :create, :destroy]
    end
    resources :books, only:[:new, :index, :create, :edit, :update, :destroy] do
      resources :favorites, only: [:create, :destroy]
    end
    resources :creations, only:[:new,:index, :create, :edit, :update, :destroy]
  end

    devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :people, only: [:index, :destroy]
  end
end
