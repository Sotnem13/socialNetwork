class CommentsController < ApplicationController

def create
		
		params[:post_comment].permit!
		comment = PostComment.create params[:post_comment]
		
		redirect_to :back
	end

	def destroy
		PostComment.find( params[:comment_id] ).destroy
		redirect_to :back
	end

end
