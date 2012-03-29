Rewards::Application.routes.draw do

	match "login" => "session#new", :as => :login
	match "logout" => "session#destroy", :as => :logout

  resources :users
	resources :rewards
	
	root :to => "rewards#index"
end
