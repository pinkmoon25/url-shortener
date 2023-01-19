Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'links#new'
  resources :links, only: [:index, :new, :create, :show]
  get ':uuid', to: "links#visit_link"
end
