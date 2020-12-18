class AddImageColumnToCampposts < ActiveRecord::Migration[5.2]
  def change
    add_column :campposts, :image, :string
  end
end
