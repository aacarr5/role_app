Rails.application.routes.draw do
  root 'welcome#index'

  resources :users do 
    resources :notes 
  end
  
  delete '/sessions' => 'sessions#destroy', as: :session_delete 
  post '/sessions' => 'sessions#create'

  get '/sessions/new' => 'sessions#new', as: :new_session

  get '/categories' => 'categories#index', as: :categories

  get '/categories/:id' => 'categories#show', as: :categories_show

end
