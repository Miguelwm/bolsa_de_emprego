class AddActivacaoToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :activo_digest, :string
    add_column :contas, :ativado_em, :datetime
  end
end
