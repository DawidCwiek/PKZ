class AddCentralToCoponents < ActiveRecord::Migration[6.0]
  def change
    add_reference :components, :central, index: true
  end
end
