class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.integer :status
      t.timestamps
    end
  end
end
