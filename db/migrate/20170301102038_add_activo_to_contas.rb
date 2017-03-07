class AddActivoToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :activo, :boolean, default: false
  end
end
