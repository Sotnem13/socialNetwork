class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text    :content
      t.timestamps
    end
  end
end
