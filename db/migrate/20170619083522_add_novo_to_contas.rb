class AddNovoToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :novo, :boolean, default: true
  end
end
