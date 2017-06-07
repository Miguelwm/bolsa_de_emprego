class Interesse < ApplicationRecord
  belongs_to :interessado, class_name: "Perfil"
  belongs_to :interessado_em, class_name: "Perfil"

  validates :interessado_id, presence: true
  validates :interessado_em_id, presence: true
end
