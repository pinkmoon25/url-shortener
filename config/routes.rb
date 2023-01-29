Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'registrations#new'
  resources :links, only: [:index, :new, :create, :show]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  delete 'logout', to: "sessions#destroy"
  get ':uuid', to: "links#visit_link"
end
