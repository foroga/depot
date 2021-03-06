class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :supplier_id
      t.string :name
      t.string :note
      t.decimal :minall, precision: 16, scale: 3
      t.decimal :mingroup, precision: 16, scale: 3
      t.decimal :minunit, precision: 16, scale: 3
      t.decimal :kgxunit, precision: 16, scale: 3
      t.string :unittype
      t.decimal :price, precision: 16, scale: 3

      t.timestamps
    end
  end
end
