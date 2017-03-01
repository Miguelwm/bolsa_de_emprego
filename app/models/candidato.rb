class Candidato < ApplicationRecord
  belongs_to :perfil, :inverse_of => :candidato
  belongs_to :area_profissional
  belongs_to :nivel_habilitacao
  belongs_to :situacao_profissional
end
