class AddEntidadesToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :entidades, :boolean, default:false
  end
end
