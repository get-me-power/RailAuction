class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :auction_id
      t.text :content

      t.timestamps
    end
  end
end
