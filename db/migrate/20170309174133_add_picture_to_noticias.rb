class AddPictureToNoticias < ActiveRecord::Migration[5.0]
  def change
    add_column :noticias, :picture, :string
  end
end
