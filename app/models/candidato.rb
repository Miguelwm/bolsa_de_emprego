class Candidato < ApplicationRecord
  belongs_to :perfil, :inverse_of => :candidato
  belongs_to :area_profissional
  belongs_to :nivel_habilitacao
  belongs_to :situacao_profissional

  validates_presence_of :perfil

  accepts_nested_attributes_for :perfil, :update_only => true

  has_many :candidaturas, class_name:  "Candidatura",
                                  foreign_key: "candidato_id",
                                  dependent:   :destroy
  has_many :ofertas, through: :candidaturas, source: :oferta

  def candidatar(oferta)
    ofertas << oferta
  end

  def ofertas?(oferta)
    ofertas.include?(oferta)
  end
end
