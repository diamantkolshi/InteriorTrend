Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }
  get 'style-example-one', to: 'inertia_example#example_one'
  get 'style-example-two', to: 'inertia_example#example_two'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "projects#index"
  resources :projects do
    resources :posts, controller: 'projects/posts', only: [:index, :new, :create, :edit, :update, :destroy] do 
      resources :ingredients, controller: 'projects/ingredients', only: [:new, :create, :edit, :update, :destroy] 
    end
  end

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', defaults: {format: 'json'}
      
      resources :posts, controller: 'posts', only: [:index, :show]
      resources :directories, controller: 'directories', only: [:index, :create, :update, :destroy]
      resources :favorites, controller: 'favorites', only: [:index, :create, :destroy]
    end
  end
end
