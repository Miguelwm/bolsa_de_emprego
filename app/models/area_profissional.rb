class AreaProfissional < ApplicationRecord
  has_many :candidato
  has_many :oferta
end
