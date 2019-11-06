class CreateCentrals < ActiveRecord::Migration[6.0]
  def change
    create_table :centrals do |t|

      t.timestamps
    end
  end
end
