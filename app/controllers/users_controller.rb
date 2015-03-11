class UsersController < ApplicationController

	skip_before_action :need_be_signed
	before_action :nothing_to_do

	def new
		@user = User.new
	end

	def create
		
		params.permit!

		@user = User.new params[:user]

		if @user.save
			sign_in @user
			redirect_to root_path
		else
			render "new"
		end

	end

	private

	def nothing_to_do
		redirect_to root_path if signed_in?
	end


end
