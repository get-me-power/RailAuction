class FixPostColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :endTime, :time
    add_column :posts, :endTime, :datetime
  end
end
