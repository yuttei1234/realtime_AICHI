class CreatePostComments < ActiveRecord::Migration[5.0]
  def change
    create_table :post_comments do |t|
      t.integer :post_image_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
