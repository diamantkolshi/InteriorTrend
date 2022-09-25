Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }
  get 'style-example-one', to: 'inertia_example#example_one'
  get 'style-example-two', to: 'inertia_example#example_two'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "projects#index"
  resources :projects do
    resources :posts, controller: 'projects/posts', only: [:index, :new, :create, :edit, :update, :destroy] do 
      resources :ingredients, controller: 'projects/ingredients', only: [:new, :edit] 
    end
  end
end
