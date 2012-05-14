DataEngineering::Application.routes.draw do
  devise_for :users

  resources :orders do
    collection do
      get :import
      post :parse
    end
  end

  resources :purchasers
  resources :merchants
  resources :items

  root :to => 'orders#import'
end
