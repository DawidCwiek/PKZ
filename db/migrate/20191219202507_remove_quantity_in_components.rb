class RemoveQuantityInComponents < ActiveRecord::Migration[6.0]
  def change
    remove_column :components, :quantity
  end
end
