class CreateCandidaturas < ActiveRecord::Migration[5.0]
  def change
    create_table :candidaturas do |t|
      t.integer :candidato_id
      t.integer :oferta_id

      t.timestamps
    end
    add_index :candidaturas, :candidato_id
    add_index :candidaturas, :oferta_id
    add_index :candidaturas, [:candidato_id, :oferta_id], unique: true
  end
end
