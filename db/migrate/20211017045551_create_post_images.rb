class CreatePostImages < ActiveRecord::Migration[5.0]
  def change
    create_table :post_images do |t|

      t.integer :user_id
      t.string :image_id
      t.string :address
      t.string :title
      t.text :caption
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
