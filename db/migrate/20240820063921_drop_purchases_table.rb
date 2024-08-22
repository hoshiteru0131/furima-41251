class DropPurchasesTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :purchases
  end

  def down
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :item_id
      t.timestamps
    end
  end
end
