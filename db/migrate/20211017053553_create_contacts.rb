class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :title
      t.text :message

      t.timestamps
    end
  end
end
