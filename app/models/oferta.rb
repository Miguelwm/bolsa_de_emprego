class Oferta < ApplicationRecord
  belongs_to :entidade
  belongs_to :area_profissional
  belongs_to :tipo_contrato
end
