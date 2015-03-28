class CreateDialogInfos < ActiveRecord::Migration
  def change
    create_table :dialog_infos do |t|
      t.integer :dialog_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
