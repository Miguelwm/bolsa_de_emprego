class CreateActividadeProfissionals < ActiveRecord::Migration[5.0]
  def change
    create_table :actividade_profissionals do |t|
      t.string :actividade

      t.timestamps
    end
  end
end
