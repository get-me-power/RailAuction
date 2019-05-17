class ChangeChatColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :auction_id, :integer
    add_column :chats, :follow_id, :integer
  end
end
