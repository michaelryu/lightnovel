Rails.application.routes.draw do
	devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
		get '/users/:id/edit', to: 'users/registrations#edit'
    match '/users/:id', :to => 'users#show', :as => :user, :via => :get
  end
  
  root "pages#home"
  resources :novels do
  	resources :chapters
  end
end
