class CreateMenusProductsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :menus, :products do |t|
      t.index :menu_id
      t.index :product_id
    end
  end
end
