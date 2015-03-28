class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :dialog_id
      t.text    :content
      
      t.timestamps
    end
  end
end
