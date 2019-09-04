class RemoveFollowColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :follows, :followed_user_id, :integer
    remove_column :follows, :integer, :string
    add_column :follows, :isBlocked, :boolean
  end
end
