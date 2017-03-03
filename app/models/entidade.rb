class Entidade < ApplicationRecord
  belongs_to :perfil, :inverse_of => :entidade
  belongs_to :actividade_profissional
  validates_presence_of :perfil
  accepts_nested_attributes_for :perfil
end
