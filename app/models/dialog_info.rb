class DialogInfo < ActiveRecord::Base

	belongs_to :dialog
	belongs_to :user
	validates :user_id, :dialog_id, presence: true


end
