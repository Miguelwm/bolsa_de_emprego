class CreateSituacaoProfissionals < ActiveRecord::Migration[5.0]
  def change
    create_table :situacao_profissionals do |t|
      t.string :situacao

      t.timestamps
    end
  end
end
