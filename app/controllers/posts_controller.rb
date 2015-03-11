class PostsController < ApplicationController

	def create
		post = Post.new
		post.owner_id = current_user.id
		post.user_id  = params[:post][:user_id]
		post.content  = params[:post][:content]

		post.save
		redirect_to user_path( params[:post][:user_id] )
	end

	def destroy
		post = Post.find(params[:post_id])
		if post.owner_id == current_user.id || post.user_id == current_user.id
			post.destroy
		else
			flash[:error] = "Permission denied"
		end
		redirect_to :back
	end
end
