class CreatePerfils < ActiveRecord::Migration[5.0]
  def change
    create_table :perfils do |t|
      t.text :morada
      t.string :codigo_postal
      t.string :localidade
      t.string :contacto1
      t.string :contacto2
      t.string :pagina
      t.text :apresentacao
      t.references :conta, foreign_key: true

      t.timestamps
    end
  end
end
