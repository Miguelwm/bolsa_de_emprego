class AddCandidatosToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :candidatos, :boolean, default:false
  end
end
