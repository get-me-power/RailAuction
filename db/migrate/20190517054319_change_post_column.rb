class ChangePostColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :auctions, :endTime, :time
    add_column :posts, :endTime, :time
  end
end
