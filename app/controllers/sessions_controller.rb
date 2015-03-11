class SessionsController < ApplicationController

	skip_before_action :need_be_signed, only: [:new, :create]

	def new
	end

	def create

		user = User.find_by(email: params[:email])

		if user && user.authenticate( params[:password] )
			sign_in user
			flash[:success] = "Welcome, #{current_user.firstname}."
			redirect_to root_url
		else
			flash.now[:error] = "Please, try again."
			render "new"
		end

	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
