class Entidade < ApplicationRecord
  belongs_to :perfil, :inverse_of => :entidade
  belongs_to :actividade_profissional
end
