class CreateSalarios < ActiveRecord::Migration[5.0]
  def change
    create_table :salarios do |t|
      t.string :quantia

      t.timestamps
    end
  end
end
