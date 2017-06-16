class ChangeCv < ActiveRecord::Migration[5.0]
  def change
    change_table :candidatos do |t|
      t.change :cv, :string
    end
  end
end
