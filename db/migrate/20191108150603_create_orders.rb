class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.decimal :total_price, precision: 10, scale: 2
      t.decimal :profit, precision: 10, scale: 2
      t.boolean :issued, default: false
      t.belongs_to :store
      
      t.timestamps
    end
  end
end
