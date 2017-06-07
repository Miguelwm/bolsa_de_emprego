class AddPasswordDigestToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :password_digest, :string
  end
end
