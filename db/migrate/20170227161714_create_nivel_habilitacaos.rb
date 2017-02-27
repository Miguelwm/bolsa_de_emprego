class CreateNivelHabilitacaos < ActiveRecord::Migration[5.0]
  def change
    create_table :nivel_habilitacaos do |t|
      t.string :nivel

      t.timestamps
    end
  end
end
