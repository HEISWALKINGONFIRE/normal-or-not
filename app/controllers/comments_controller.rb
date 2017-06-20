class CommentsController < ApplicationController
	# only allow users to comment
	before_action :require_user, only:[:new, :create]
 	before_action :set_post, :except => [:upvote, :downvote]
	def index
		@comment = Comment.all
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.body == ""
			redirect_to :back
		else
			 @comment.save
		create_notification @post, @comment
		respond_to do |format|
			format.html { redirect_to "/posts/" + params[:comment][:post_id]}
			format.js
		end
		end
		# redirect_to "/posts/" + params[:comment][:post_id]

	end

	def upvote
		@comment_all = Comment.find(params[:id])
		@comment_all.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@comment_all = Comment.find(params[:id])
		@comment_all.downvote_by current_user
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
	def create_notification(post, comment)
    return if user_id_in_post == current_user.id
    Notification.create(user_id: user_id_in_post,
                        notified_by_id: current_user.id,
                        post_id: set_post,
                        identifier: finding_comment_id,
                        notice_type: 'comment')

	end
	# post.user.id
	def set_post
	 @post = params[:comment][:post_id]

 	end

	def user_id_in_post
		 @ans = Post.find(@post).user_id
	end
	def finding_comment_id
		@c_id=Comment.last.id
	end

end
