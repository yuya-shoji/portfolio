Rails.application.routes.draw do
  devise_for :admins, controllers:{
  sessions: "admins/sessions",
  password: "admins/password",
  registrations: "admins/registrations"
  }


  namespace :admins do
  get '' => 'homes#top', as: :root
  get '/about' => 'homes#about', as: 'about'
  get '/reservations/complete' => 'reservations#complete', as: 'complete_reservation'
  get '/reservations/:id/confirm' => 'reservations#confirm', as: 'reservation_confirm'
  post '/reservations/:id/confirm', controller: 'registrations', action:'confirm'
  resources :reservations, expect:[:create] do
    resources :contacts, only:[:index, :update, :show]
  end
  resources :reservations_all, only:[:index]
  get '/reservations_all/search' => 'reservations_all#search', as: 'reservations_all_search'

  end

  devise_for :customers
  root to: 'homes#top'
  get 'about' => 'homes#about'
  patch 'customers/out' => 'customers#out', as: 'out_customers'
  get 'customers/quit' => 'customers#quit', as: 'quit_customers'
  get 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customers'
  resources :customers, only:[:show, :edit, :update]
  get 'reservations/select' => 'reservations#select', as: 'reservations_select'
  post 'registrations/new', controller: 'registrations', action: 'new'
  get 'reservations/log' => 'reservations#log', as: 'log_reservations'
  post 'reservations/log', controller: 'reservations', action: 'log'
  get 'reservations/thank' => 'reservations#thank', as: 'thank_reservations'
  get 'reservations/search' => 'reservations#search', as:'reservations_search'
  resources :staffs, only:[:show]
  resources :reservations, only:[:index, :show, :new, :create] do
    resources :contacts, only:[:index,:create]
  end
end
