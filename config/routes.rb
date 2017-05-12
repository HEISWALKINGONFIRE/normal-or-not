Rails.application.routes.draw do

	root 'posts#index'
	resources :posts
	resources :abouts
	get'signup' => 'user#new'
	resources :users
	get'/login' => 'sessions#new'
	post'/login' => 'sessions#create'
	# post'/logout' => 'sessions#destroy'
	get '/logout' => 'sessions#destroy'
	resources :sessions
	resources :comments
	get '/delete'=> 'posts#destroy'
	# votes for post
	patch '/upvote' => 'posts#upvote'
	patch '/downvote' => 'posts#downvote'
	# vote for comments
	patch '/upvote_c' => 'comments#upvote_c'

	patch "/downvote_c" => "comments#downvote_c"
	get'/all' => 'posts#all'

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
