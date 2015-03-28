class User < ActiveRecord::Base

	has_secure_password

	validates :firstname, :lastname, :email, presence: true
		
	validates :email, format: { with: /.+@.+\..+/ }, uniqueness: { case_sensitive: false }
	validates :url, format: { with: /([a-z]|\d)+/ }, uniqueness: { case_sensitive: false }, on: :update, allow_blank: true
	
	
	validates :password, confirmation: true, length: { minimum: 6 }, on: :create 
	validates :password_confirmation, presence: true, on: :create
	
	has_many :posts
	has_many :albums
	
	before_validation do |user|
		user.url ||= user.id.to_s
		user.url.downcase!
		user.firstname = user.firstname.mb_chars.capitalize.to_s
		user.lastname  = user.lastname.mb_chars.capitalize.to_s
	end

end
