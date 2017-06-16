class AddFotoToNoticias < ActiveRecord::Migration[5.0]
  def change
    add_column :noticias, :foto, :string
  end
end
