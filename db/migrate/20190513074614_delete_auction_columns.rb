class DeleteAuctionColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :auctions, :user_id, :integer
    add_column :auctions, :isShowed, :boolean
    add_column :auctions, :endTime, :time
  end
end
