Rails.application.routes.draw do
  devise_for :admins

  namespace :admins do
  get 'admins' => 'homes#top'
  get 'admins/about' => 'homes#about'
  get 'admins/reservations/complete' => 'reservations#complete'
  resources :reservations, expect:[:create]

  end

  devise_for :customers
  root to: 'homes#top'
  get 'about' => 'homes#about'
  patch '/customers/out' => 'customers#out', as: 'out_customers'
  get 'customers/quit' => 'customers#quit', as: 'quit_customers'
  resources :customers, only:[:show, :edit, :update]
  get '/reservations/log' => 'reservations#log', as: 'log_reservations'
  get '/reservations/thank' => 'reservations#thank', as: 'thank_reservations'
  resources :reservations, only:[:index, :show, :new, :create]
  resources :staffs, only:[:index]
  resources :contacts, only:[:index]
end
