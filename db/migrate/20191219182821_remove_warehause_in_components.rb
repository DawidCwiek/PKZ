class RemoveWarehauseInComponents < ActiveRecord::Migration[6.0]
  def change
    remove_column :components, :warehouse_id
  end
end
