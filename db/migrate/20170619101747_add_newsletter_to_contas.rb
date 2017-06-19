class AddNewsletterToContas < ActiveRecord::Migration[5.0]
  def change
    add_column :contas, :newsletter, :boolean, default:false
  end
end
