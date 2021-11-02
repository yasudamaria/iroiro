Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 
  root 'kanris#asobi'
 
  get 'top' => 'kanris#top'
  get 'hello/index' => 'hello#index'
  get 'about' => 'kanris#about'
  get 'nindex' => 'kanris#nindex'
  get 'genre' => 'kanris#genre'
  get 'kanris/gindex' => 'kanris#gindex'
  resources :kanris

 
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

end
