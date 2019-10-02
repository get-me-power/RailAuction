class DeleteFollowColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :follows, :content, :text
  end
end
