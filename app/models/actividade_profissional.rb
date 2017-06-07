class ActividadeProfissional < ApplicationRecord
  has_many :entidade, :inverse_of => :actividade_profissional
end
