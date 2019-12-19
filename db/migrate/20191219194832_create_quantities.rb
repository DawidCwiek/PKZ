class CreateQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :quantities do |t|
      t.integer :component_id
      t.integer :warehouse_id
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
