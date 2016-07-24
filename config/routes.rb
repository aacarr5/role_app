Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do 
    resources :notes 
  end
  
  delete '/sessions' => 'sessions#destroy', as: :session_delete 
  post '/sessions' => 'sessions#create'

  get '/sessions/new' => 'sessions#new', as: :new_session

end
