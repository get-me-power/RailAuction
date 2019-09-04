class ChangePostEndTimeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :endTime, :date
    add_column :posts, :endTime, :datetime
  end
end
