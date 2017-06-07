class AddSalarioToOferta < ActiveRecord::Migration[5.0]
  def change
    add_reference :ofertas, :salario, foreign_key: true
  end
end
