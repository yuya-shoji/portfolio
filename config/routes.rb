Rails.application.routes.draw do
  devise_for :admins, controllers:{
  sessions: "admins/sessions",
  password: "admins/password",
  registrations: "admins/registrations"
  }

  namespace :admins do
  get 'admins' => 'homes#top', as: :root
  get 'admins/about' => 'homes#about', as: 'about'
  get 'admins/reservations/complete' => 'reservations#complete'
  get 'admins/reservations/confirm' => 'reservations#confirm'
  resources :reservations, expect:[:create]
  resources :contacts, only:[:index, :create, :show]
  resources :reservations_all, only:[:index]

  end

  devise_for :customers
  root to: 'homes#top'
  get 'about' => 'homes#about'
  patch '/customers/out' => 'customers#out', as: 'out_customers'
  get 'customers/quit' => 'customers#quit', as: 'quit_customers'
  resources :customers, only:[:show, :edit, :update]
  get '/reservations/log' => 'reservations#log', as: 'log_reservations'
  post 'reservations/log', controller: 'reservations', action: 'log'
  get '/reservations/thank' => 'reservations#thank', as: 'thank_reservations'
  resources :reservations, only:[:index, :show, :new, :create]
  resources :staffs, only:[:index]
  resources :contacts, only:[:index]
end
