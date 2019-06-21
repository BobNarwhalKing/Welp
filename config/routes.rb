Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers, :foods, :orders, :restaurants, :reviews, :ordered_foods

get '/', to: 'customers#login_form'

get '/search', to: 'customers#search'

post 'customers/authenticate', to: 'customers#authenticate'

get '/logout', to: 'customers#log_out'

end
