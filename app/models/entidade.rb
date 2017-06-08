class Entidade < ApplicationRecord
  belongs_to :perfil, :inverse_of => :entidade
  belongs_to :actividade_profissional
  has_many :ofertas ,dependent: :destroy
  validates_presence_of :perfil
  accepts_nested_attributes_for :perfil, :update_only => true




end
