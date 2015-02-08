Rails.application.routes.draw do
	devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
		get '/users/:id/edit', to: 'users/registrations#edit'
    match '/users/:id', :to => 'users#show', :as => :user, :via => :get
  end
  
  root "pages#home"
  get 'popular' => "pages#popular"
  get 'newest' => "pages#newest"

  resources :novels do
    member do 
      put "like", to: "novels#bookmark"
      put "unlike", to: "novels#removemark"
    end
  	resources :chapters
  end

end
