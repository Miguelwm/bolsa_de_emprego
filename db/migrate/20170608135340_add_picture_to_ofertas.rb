class AddPictureToOfertas < ActiveRecord::Migration[5.0]
  def change
    add_column :ofertas, :foto, :string
  end
end
