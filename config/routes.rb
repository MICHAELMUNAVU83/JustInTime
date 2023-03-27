Rails.application.routes.draw do
  resources :donations
  devise_for  :users

  authenticated :user do
    root to: "donations#index", as: :authenticated_root
  end

  unauthenticated do
    root to: "pages#home"
  end


 


  

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
