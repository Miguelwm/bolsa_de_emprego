class AddOfertasToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :ofertas, :boolean, default:false
  end
end
