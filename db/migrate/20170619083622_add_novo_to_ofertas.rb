class AddNovoToOfertas < ActiveRecord::Migration[5.0]
  def change
    add_column :ofertas, :novo, :boolean, default:true
  end
end
