class CreateContas < ActiveRecord::Migration[5.0]
  def change
    create_table :contas do |t|
      t.string :nome
      t.string :email

      t.timestamps
    end
  end
end
