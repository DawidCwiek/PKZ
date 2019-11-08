class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.integer :store_id
      t.integer :user_id
      t.boolean :manager, default: false
      
      t.timestamps
    end
  end
end
