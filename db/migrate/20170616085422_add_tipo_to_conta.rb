class AddTipoToConta < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :tipo, :string
  end
end
