module MessagesHelper

	def dialog_name dialog
		return unless dialog
		res = ""
		dialog.dialog_infos.each do |d|
			if d.user
				res += "#{d.user.firstname} #{d.user.lastname} " unless current_user == d.user
				
			end
			
		end

		res
	end

	def dialog_ava dialog
		res = ''
		dialog.dialog_infos.each do |d|
			res =  link_to image_tag(  user_ava( d.user ) , class: 'meta_image' ), d.user  unless current_user == d.user
		end

		res
	end
	
	def dialog_message dialog
		dialog.messages.last.content
	end



end
