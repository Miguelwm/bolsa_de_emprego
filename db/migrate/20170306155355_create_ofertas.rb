class CreateOfertas < ActiveRecord::Migration[5.0]
  def change
    create_table :ofertas do |t|
      t.string :titulo
      t.date :val_inicio
      t.date :val_fim
      t.text :descricao
      t.boolean :activo, default: false
      t.references :entidade, foreign_key: true
      t.references :area_profissional, foreign_key: true
      t.references :tipo_contrato, foreign_key: true

      t.timestamps
    end
  end
end
