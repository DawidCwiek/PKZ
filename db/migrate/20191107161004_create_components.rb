class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.string :name
      t.integer :quantity, default: 0
      t.decimal :cost, precision: 10, scale: 2

      t.belongs_to :warehouse

      t.timestamps
    end
  end
end
