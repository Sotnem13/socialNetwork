class PhotosController < ApplicationController

	def show
		@user = User.find_by_id params[:user_id]
		@edit = current_user == @user
		@photos = Album.find_by( user_id: @user.id, id: params[:album_id] ).photos
		render "index"
	end

	def albums
		@user = User.find_by_id params[:user_id]
		@edit = current_user == @user
		@albums = @user.albums
	end

	def add_ava

		ava_album = Album.where( user_id: current_user.id, name: "ava" ).take

		if ava_album.nil?
			ava_album = Album.new
			ava_album.user = current_user
			ava_album.name = "ava"
			ava_album.save
		end

		photo = Photo.new
		photo.album = ava_album
		photo.user = current_user
		photo.url = "/photos/#{Photo.last.id}"
		uploaded_io = params[:photo]

  		File.open(Rails.root.join('public', 'photos', Photo.last.id.to_s), 'wb') do |file|
    		file.write(uploaded_io.read)
  		end
  		flash[:succes] = "Uploaded"
  		photo.save


  		redirect_to :back
	end

	def add
		
	end

	def destroy
		
		Photo.find_by_id( params[:photo_id] ).destroy
		redirect_to :back
	
	end

	def destroy_album
		
		Album.find_by_id( params[:album_id] ).destroy
		redirect_to :back
	
	end


end
