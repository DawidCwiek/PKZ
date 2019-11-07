class CreateWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouses do |t|

      t.integer :warehousable_id
      t.string :warehousable_type

      t.timestamps
    end

    add_index :warehouses, [:warehousable_type, :warehousable_id]
  end
end
