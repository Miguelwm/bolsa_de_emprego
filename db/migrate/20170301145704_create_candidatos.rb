class CreateCandidatos < ActiveRecord::Migration[5.0]
  def change
    create_table :candidatos do |t|
      t.date :nascimento
      t.string :bi
      t.text :habilitacao
      t.text :experiencia
      t.binary :cv
      t.references :perfil, foreign_key: true
      t.references :area_profissional, foreign_key: true
      t.references :nivel_habilitacao, foreign_key: true
      t.references :situacao_profissional, foreign_key: true

      t.timestamps
    end
  end
end
