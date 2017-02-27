class CreateAreaProfissionals < ActiveRecord::Migration[5.0]
  def change
    create_table :area_profissionals do |t|
      t.string :area

      t.timestamps
    end
  end
end
