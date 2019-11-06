class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :zip_code
      t.string :street
      
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
