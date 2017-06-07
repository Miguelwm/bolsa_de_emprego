class Candidatura < ApplicationRecord
  belongs_to :candidato
  belongs_to :oferta

  validates :candidato_id, presence: true
  validates :oferta_id, presence: true
end
