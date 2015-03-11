class Post < ActiveRecord::Base
	has_many :postComments
	has_many :postLikes
	belongs_to :user

end
