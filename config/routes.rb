Rails.application.routes.draw do
<<<<<<< Updated upstream
  
=======
  devise_for :users
  root "items#index"
  resources :items
>>>>>>> Stashed changes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
