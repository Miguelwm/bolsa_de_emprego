class AddDestaqueToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :destaque, :boolean, default: false
  end
end
