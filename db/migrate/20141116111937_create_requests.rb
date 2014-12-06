class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :item_id
      t.integer :unit_id
      t.decimal :requested
      t.decimal :received
      t.decimal :priceini
      t.decimal :priceend

      t.timestamps
    end
  end
end
