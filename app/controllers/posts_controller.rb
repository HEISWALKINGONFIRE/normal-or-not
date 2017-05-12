class PostsController < ApplicationController
	# only allow users to post
	before_action :require_user, only: [:new]


	def index
		@post = Post.all.order("created_at DESC")
	end
	def all
		@post_all = Post.all
	end
	def new
		@post = Post.new
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
		@post_find = Post.all.find(params[:id])



		# @user_id = Post.id
	end
	def update
	end
	# upvote
	def upvote
		@post = Post.find(params[:post][:id])
		@post.upvote += 1
		@post.save
		redirect_to :back
	end

	def downvote
		@post = Post.find(params[:post][:id])
		@post.downvote += -1
		@post.save
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
