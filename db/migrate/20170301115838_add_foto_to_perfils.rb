class AddFotoToPerfils < ActiveRecord::Migration[5.0]
  def change
    add_column :perfils, :foto, :string
  end
end
