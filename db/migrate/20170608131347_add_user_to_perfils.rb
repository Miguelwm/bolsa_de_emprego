class AddUserToPerfils < ActiveRecord::Migration[5.0]
  def change
    add_column :perfils, :user, :integer
  end
end
