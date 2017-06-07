class CreateInteresses < ActiveRecord::Migration[5.0]
  def change
    create_table :interesses do |t|
      t.integer :interessado_id
      t.integer :interessado_em_id

      t.timestamps
    end
    add_index :interesses, :interessado_id
    add_index :interesses, :interessado_em_id
    add_index :interesses, [:interessado_id, :interessado_em_id], unique: true
  end
end
