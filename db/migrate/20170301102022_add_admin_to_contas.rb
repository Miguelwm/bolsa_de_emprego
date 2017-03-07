class AddAdminToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :admin, :boolean, default: false
  end
end
