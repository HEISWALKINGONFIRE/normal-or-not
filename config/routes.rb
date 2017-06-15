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
	# patch '/upvote' => 'posts#upvote'
	# patch '/downvote' => 'posts#downvote'
	# vote for comments
	# patch '/upvote_c' => 'comments#upvote_c'
	#
	# patch "/downvote_c" => "comments#downvote_c"
	get'/all' => 'posts#all'
	# vote comments
 	put '/comments/:id/upvote', to: 'comments#upvote', as: 'like_comment'
	put'/comment/:id/downvote', to: 'comments#downvote', as: 'dislike_comment'

	# resources :comments do
	# 	member do
	# 		# put 'like', to: "comments#upvote"
	# 		# put 'dislike', to: 'comments#downvote'
	# 	end
	# end
	resources :posts do
	  member do
	    put "like", to: "posts#upvote"
	    put "dislike", to: "posts#downvote"
	  end
	end
	resources :profiles
	resources :notifications
	get 'notifications/:id/link_through', to: 'notifications#link_through',
																			 as: :link_through

# like_post_comment PUT      /posts/:post_id/comments/:id/like(.:format)
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
