class Message < ActiveRecord::Base

	belongs_to :user
	belongs_to :dialog

	validates :content, :user_id, :dialog_id, presence: true


end
