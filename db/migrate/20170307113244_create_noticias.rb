class CreateNoticias < ActiveRecord::Migration[5.0]
  def change
    create_table :noticias do |t|
      t.string :titulo
      t.date :data
      t.text :sumario
      t.text :texto
      t.boolean :destaque
      t.boolean :activo
      t.references :conta, foreign_key: true

      t.timestamps
    end
  end
end
