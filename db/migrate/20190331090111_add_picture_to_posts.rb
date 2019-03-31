class AddPictureToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :picture, :string
    add_column :posts, :user_id, :integer
  end
end
