module SessionsHelper



  def current_user
  	begin
  		@current_user ||= cookies.signed[:user_id] && User.find(cookies.signed[:user_id])
  	rescue
  		sign_out
  	end 
  end

  def current_user=(user)
  	@current_user = user
  end

  def sign_in(user)
    cookies.signed[:user_id] = user.id
    self.current_user = user
  end

  def sign_out
    cookies.delete(:user_id)
    self.current_user = nil
  end

  def signed_in?
    !current_user.nil?
  end

end
