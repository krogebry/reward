Rewards::Application.routes.draw do

  resources :badge_types

  resources :reward_types

  resources :badges

	match "rewards/redeem" => "rewards#redeem", :as => :redeem

	match "login" => "session#new", :as => :login
	match "logout" => "session#destroy", :as => :logout

  resources :users
	resources :rewards
	
	root :to => "rewards#index"
end
