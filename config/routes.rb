Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :products do
        collection do
          get 'page/:id', to: 'products#page'
        end
      end
    end
  end
end
