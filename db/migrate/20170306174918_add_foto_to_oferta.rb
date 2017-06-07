class AddFotoToOferta < ActiveRecord::Migration[5.0]
  def change
    add_column :ofertas, :picture, :string
  end
end
