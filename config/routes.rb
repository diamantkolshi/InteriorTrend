Rails.application.routes.draw do
  devise_for :users
  get 'style-example-one', to: 'inertia_example#example_one'
  get 'style-example-two', to: 'inertia_example#example_two'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
