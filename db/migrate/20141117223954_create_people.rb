class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :unit_id
      t.string :nickname
      t.string :accesslevel
      t.string :name
      t.string :surname
      t.string :email
      t.integer :telefone
      t.string :password_digest
      t.boolean :active
      t.string :note

      t.timestamps
    end
  end
end
