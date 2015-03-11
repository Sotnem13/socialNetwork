class CreatePostLikes < ActiveRecord::Migration
  def change
    create_table :post_likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
