class AddActivoToConta < ActiveRecord::Migration[5.0]
  def change
    add_column :conta, :activo, :boolean, default: false
  end
end
