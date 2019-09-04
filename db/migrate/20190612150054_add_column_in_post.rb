class AddColumnInPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :isShowed, :boolean
  end
end
