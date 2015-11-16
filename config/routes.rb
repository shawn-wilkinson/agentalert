Rails.application.routes.draw do
  require 'sidekiq/web'

  # get '/users/test_number' => 'users#test_number'
  resources :users

  get '/about' => 'welcome#about'

  get '/logout' => 'users#logout'
  get '/login' => 'users#login'
  post '/login' => 'users#authenticate'


  post '/contacts' => 'contacts#create'
  get '/contacts/destroy/:id' => 'contacts#destroy'

  get '/interface/incoming' => 'interface#incoming'
  get '/interface/test_user_number/:id' => 'interface#test_user_number'
  get '/interface/test_contact_number/:id' => 'interface#test_contact_number'
  get '/interface/user_signup/:id' => 'interface#user_signup'

  root 'welcome#index'


  mount Sidekiq::Web => '/sidekiq'

end
