class Entidade < ApplicationRecord
  belongs_to :perfil, :inverse_of => :entidade
  belongs_to :actividade_profissional
  has_many :ofertas ,dependent: :destroy
  validates_presence_of :perfil
  accepts_nested_attributes_for :perfil, :update_only => true


validates :nif, presence: true, allow_blank: false
validates :actividade_profissional_id, presence:true, allow_blank: false




end
