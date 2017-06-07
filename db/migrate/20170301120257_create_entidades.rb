class CreateEntidades < ActiveRecord::Migration[5.0]
  def change
    create_table :entidades do |t|
      t.string :nif
      t.references :perfil, foreign_key: true
      t.references :actividade_profissional, foreign_key: true

      t.timestamps
    end
  end
end
