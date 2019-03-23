class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :product_name
      t.integer :price

      t.timestamps
    end
  end
end
