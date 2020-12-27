class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true, null: false
      t.references :camppost, foreign_key: true, null: false

      t.timestamps
      
      t.index [:user_id, :camppost_id], unique: true
    end
  end
end
