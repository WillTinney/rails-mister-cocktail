Rails.application.routes.draw do

  root 'cocktails#index'

  resources :cocktails, only: [ :index, :show, :new, :create, :edit, :delete ] do
    resources :doses, only: [ :new, :create, :destroy ]
  end

  resources :ingredients

end
