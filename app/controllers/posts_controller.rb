class PostsController < ApplicationController
	# only allow users to post
	before_action :require_user, only: [:new]
layout nil, :only => [:new]

	def index
		@post = Post.all.order("created_at DESC")
	  # @notification = Notification.where(:user_id => current_user.id)


	end
	def all
		@post_all = Post.all
	end
	def new
		@post = Post.new
		@notification = Notification.where(:user_id => current_user.id)
	end
# render new and redirect error
	def create

		@post = Post.new(post_params)
		if @post.tag == ""
		else
			@post.save
			redirect_to "#"
			flash[:info] = "Post submited!"
		end
	end
	def show
		@post = Post.find(params[:id])
		@comment_new = Comment.new()
		@comment_all = Comment.where(post_id:params[:id])
		# @comment_find_id = Comment.find(params[:id])
		@post_find = Post.all.find(params[:id])
		  # @notification = Notification.where(:user_id => current_user.id)



		# @user_id = Post.id
	end
	def update
	end
	# upvote

	def upvote
		@post = Post.find(params[:id])
		@post.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@post = Post.find(params[:id])
		@post.downvote_by current_user
		redirect_to :back
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to "/"
	end

	private
	def post_params
		params.require(:post).permit(:title, :tag, :body, :user_id)

	end

end
