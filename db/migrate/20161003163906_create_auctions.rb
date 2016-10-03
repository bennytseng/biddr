class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.text :title
      t.string :details
      t.datetime :date
      t.float :price

      t.timestamps
    end
  end
end
