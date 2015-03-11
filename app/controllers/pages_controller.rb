class PagesController < ApplicationController

  def index

    if params[:user_id].nil? || params[:user_id] == current_user.id.to_s
      @user = current_user
      @add_friend = false
    else
      @user = User.find_by_id( params[:user_id] )
      @user ||= User.find_by( url:  params[:user_id] )

      @add_friend = Friend.where( user1_id: current_user.id, user2_id: params[:user_id] ).take.nil?
      
    end
    if @user.nil? 
      flash.now[:error] = "User not found"
      render "user_not_found" and return
    end

    @posts = @user.posts

  end

  def settings
    @user = current_user
  end


end
