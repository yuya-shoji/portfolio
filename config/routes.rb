Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  root to: 'homes#top'
  resources :customers, only:[:index, :show, :edit, :update]

end
