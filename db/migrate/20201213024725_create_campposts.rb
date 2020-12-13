class CreateCampposts < ActiveRecord::Migration[5.2]
  def change
    create_table :campposts do |t|
      t.string :content
      t.string :address
      t.string :image_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
