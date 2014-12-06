class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.datetime :date
      t.string :concept
      t.decimal :amountini, precision: 10, scale: 2
      t.decimal :amountend, precision: 10, scale: 2
      t.string :state
      t.string :note

      t.timestamps
    end
  end
end
