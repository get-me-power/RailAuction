class ChangeFollowTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :follows, :user_id, :interger
    add_column :follows, :followTo, :interger
    add_column :follows, :followFrom, :interger
    add_column :follows, :content, :text
  end
end
