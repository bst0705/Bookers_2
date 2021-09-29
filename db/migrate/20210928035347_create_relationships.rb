class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :following_id, null: false
      t.integer :follower_id, null: false

      t.timestamps

      t.index [:user_id, :follower_id, :following_id], unique: true

    end
  end
end
