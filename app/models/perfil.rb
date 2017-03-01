class Perfil < ApplicationRecord
  belongs_to :conta, :inverse_of => :perfil
  has_one :entidade, :inverse_of => :perfil
  has_one :candidato, :inverse_of => :perfil
  mount_uploader :foto, PictureUploader
end
