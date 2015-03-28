class MessagesController < ApplicationController

	
	def index
		@dialogs = DialogInfo.where( user_id: current_user.id ).map { |e| e.dialog }
	end



	def create
		@dialog = find_or_create_dialog params[:user_id]

		
		render "dialog"

	end

	def send_message
		@dialog = Dialog.where( id: params[:message][:dialog_id] ).take
		Message.create( user_id: current_user.id, content: params[:message][:content], dialog_id: params[:message][:dialog_id] )
		render "dialog"		
	end

	def get
		@dialog = Dialog.where( id: params[:dialog_id] ).take
		@messages = @dialog.messages

	end

	def dialog
		@dialog = Dialog.find_by( id: params[:dialog_id] )
		render "dialog"	
	end

private
	
	def find_or_create_dialog user_id

		DialogInfo.where( user_id: current_user.id ).each do |dialog_info|
			dialog = dialog_info.dialog

			dialog.dialog_infos.each do |d| 
				flash.now[:alert] = flash.now[:alert].to_s + ' :: ' + d.user_id.to_s + ' ' + user_id.to_s;
				return d.dialog if d.user_id.to_s == user_id.to_s  
			end

		end

		dialog = Dialog.create

		dialog_info = DialogInfo.create( user_id: params[:user_id], dialog_id: dialog.id ) 
		dialog_info = DialogInfo.create( user_id: current_user.id, dialog_id: dialog.id ) 
	
		dialog
	end


end
