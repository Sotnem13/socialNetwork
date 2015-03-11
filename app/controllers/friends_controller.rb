class FriendsController < ApplicationController


	def index
		@friends = Friend.where( user1_id: current_user.id )
	end

	def show
		@friends = Friend.where( user1_id: params[:user_id] )
		render "index"
	end

	def destroy
		@friends = Friend.where( user1_id: current_user.id, user2_id: params[:user_id] ).take
		@friends.destroy
		redirect_to :back
	end

	def add

		@friends = Friend.where( user1_id: current_user.id, user2_id: params[:user_id] ).take
		if @friends.nil?
			f = Friend.new
			f.user1_id = current_user.id
			f.user2_id = params[:user_id]
			f.save
			flash[:notice] = "Add"
		end
		redirect_to :back
	end



end
