class Dialog < ActiveRecord::Base

	has_many :dialog_infos
	has_many :messages


end
