module PhotosHelper

	def user_ava user
		return "/photos/camera_200.gif" unless user
		ava_album = Album.where( user_id: user.id, name: "ava" ).take
		if ava_album.nil?
			return "/photos/camera_200.gif"
		end
		ava_album.photos.last.url
		
	end


end
