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
		params[:album_name] = 'ava'
		add
	end

	def add
		uploaded_io = params[:photo]
		redirect_to :back and flash[:error] = "=(" and return unless uploaded_io 
		album = Album.where( user_id: current_user.id, name: params[:album_name] ).take

		if album.nil?
			album = Album.new
			album.user = current_user
			album.name = params[:album_name]
			album.save
		end

		photo = Photo.new
		photo.album = album
		photo.user = current_user
		if Photo.last.nil? 
			photo.url = "/photos/0"
		else
			photo.url = "/photos/#{Photo.last.id}"
		end
		uploaded_io = params[:photo]
		File.open(Rails.root.join('public', 'photos', Photo.last.id.to_s), 'wb') do |file|
    		file.write(uploaded_io.read)
  		end
  		flash[:success] = "Uploaded"
  		photo.save

  		redirect_to :back
	end

	def destroy
		binding.pry 
		Photo.find_by_id( params[:photo_id] ).destroy
		redirect_to :back
	
	end

	def destroy_album
		
		Album.find_by_id( params[:album_id] ).destroy
		redirect_to :back
	
	end




end
