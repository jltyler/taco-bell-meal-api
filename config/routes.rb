# frozen_string_literal: true
Rails.application.routes.draw do
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
  # resources :menu_items, only: %i[index show]
  get 'menu-items' => 'menu_items#index'
  get 'menu-items\:id' => 'menu_items#show'
  resources :meals, except: %i[new edit]
  # resources :meal_items, except: %i[new edit]
  get 'meal-items/:id' => 'meals#get_items'
  post 'add-item/:id' => 'meals#add_item'
  delete 'delete-item/:id' => 'meals#delete_item'
end
