class AddLembrarDigestToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :lembrar_digest, :string
  end
end
