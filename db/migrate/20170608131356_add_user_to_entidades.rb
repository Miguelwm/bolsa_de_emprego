class AddUserToEntidades < ActiveRecord::Migration[5.0]
  def change
    add_column :entidades, :user, :integer
  end
end
