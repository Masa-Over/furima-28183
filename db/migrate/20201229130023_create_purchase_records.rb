class CreatePurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_records do |t|
      t.integer :user_id, null: false 
      t.integer :item_id, null: false

      t.timestamps
    end
  end
end
