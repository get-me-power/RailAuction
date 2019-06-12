class ChangePostEndTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :endTime, :time
    add_column :posts, :endTime, :date
  end
end
