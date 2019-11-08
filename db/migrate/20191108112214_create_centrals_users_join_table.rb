class CreateCentralsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :centrals, :users do |t|
      t.index :central_id
      t.index :user_id
    end
  end
end
