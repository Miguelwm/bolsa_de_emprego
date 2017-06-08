class AddUserToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :user, :integer
  end
end
