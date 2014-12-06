class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :state
      t.datetime :date
      t.decimal :requested
      t.decimal :received
      t.decimal :priceini
      t.decimal :priceend

      t.timestamps
    end
  end
end
