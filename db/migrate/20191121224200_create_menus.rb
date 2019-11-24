class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.boolean :active, default: false
      
      t.belongs_to :central
      t.timestamps
    end
  end
end
