class CreateUtilizadors < ActiveRecord::Migration[5.0]
  def change
    create_table :utilizadors do |t|
      t.string :nome
      t.string :email
      t.text :morada
      t.string :codigo_postal
      t.string :localidade
      t.string :contacto1
      t.string :contacto2
      t.string :pagina

      t.timestamps
    end
  end
end
