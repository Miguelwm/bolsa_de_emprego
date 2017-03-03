class Perfil < ApplicationRecord
  belongs_to :conta, :inverse_of => :perfil
  validates_presence_of :conta
  has_one :entidade, :inverse_of => :perfil
  has_one :candidato, :inverse_of => :perfil
  accepts_nested_attributes_for :entidade, allow_destroy: true
  accepts_nested_attributes_for :candidato, allow_destroy: true
  accepts_nested_attributes_for :conta
  mount_uploader :foto, PictureUploader
end
