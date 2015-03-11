class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper
  include PhotosHelper
  
  before_action :need_be_signed

  private

  def need_be_signed
  	redirect_to sign_in_path unless signed_in?
  end

end
