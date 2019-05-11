class ChangeChatColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :chat :auction_id :integer
    add_column :chat :follow_id :integer
  end
end
