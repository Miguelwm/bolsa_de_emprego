class AddAdminToConta < ActiveRecord::Migration[5.0]
  def change
    add_column :conta, :admin, :boolean, default: false
  end
end
