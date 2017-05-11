class CommentsController < ApplicationController
	# only allow users to comment
	before_action :require_user, only:[:new, :create]
	def index
		@comment = Comment.all
	end
	def new
		@comment = Comment.new
	end
	def create
		@comment = Comment.new(comment_params)
		@comment.save
		redirect_to "/posts/" + params[:comment][:post_id]
		# # @comment.user = user.current_user
		# @comment.user_id = current_user.id
		# add a user.id in post
	end
	# undone
	def upvote_c
		@comment_all = ::Comment.find(params[:comment][:id])
		@comment_all.upvote += 1
		@comment_all.save
		redirect_to :back
	end

	def downvote_c
		@comment_all = Comment.find(params[:comment][:id])
		@comment_all.downvote += 1
		@comment_all.save
		redirect_to :back
	end

	def delete
		@comment = Comment.find(params[:id])
		@comment.destroy
		flash[:alert] = "Comment deleted."

	end
	private
	def comment_params
		params.require(:comment).permit(:body, :post_id, :user_id)
	end


end
