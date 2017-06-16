class AddResetToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :reset_digest, :string
    add_column :contas, :reset_sent_at, :datetime
  end
end
