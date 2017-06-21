class AddCandidaturasToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :candidaturas, :boolean, default:false
  end
end
