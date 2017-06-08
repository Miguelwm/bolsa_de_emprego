class AddUserToCandidatos < ActiveRecord::Migration[5.0]
  def change
    add_column :candidatos, :user, :integer
  end
end
