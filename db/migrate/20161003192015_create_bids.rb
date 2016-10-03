class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.references :auction, index: true, foreign_key: true
      t.float :price
      t.string :user

      t.timestamps
    end
  end
  rename_column :auctions, :username, :user
end
