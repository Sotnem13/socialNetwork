class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :owner_id
      t.text    :content
	  t.timestamps
    end
  end
end