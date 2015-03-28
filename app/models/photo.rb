class Photo < ActiveRecord::Base

	belongs_to :user
	belongs_to :album

	validates :url, :user_id, :album_id, presence: true


end
