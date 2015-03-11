class SettingsController < ApplicationController



  def update

  	params[:user].permit!
	current_user.update_attributes params[:user]
  

	save_and_back current_user

  end

  def update_url
  	current_user.url = params[:user][:url]
	
	save_and_back current_user

  end

   def update_password

   	if current_user.authenticate params[:user][:password_current]
		current_user.password = params[:user][:password]
		current_user.password_confirmation = params[:user][:password_confirmation]
	else
		flash[:error] = "Permission denied"
		redirect_to :back and return
	end
	save_and_back current_user

  end

  private

  def save_and_back( user )

    unless user.save
    	flash[:error] = user.errors.full_messages.join(". ")
    else
   		flash[:success] = "Updated"
    	
    end

    redirect_to :back
  	
  end

end
