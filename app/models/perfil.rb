class Perfil < ApplicationRecord
  belongs_to :conta, :inverse_of => :perfil
  validates_presence_of :conta
  has_one :entidade, :inverse_of => :perfil ,dependent: :destroy
  has_one :candidato, :inverse_of => :perfil ,dependent: :destroy
  accepts_nested_attributes_for :entidade, allow_destroy: true
  accepts_nested_attributes_for :candidato, allow_destroy: true
  accepts_nested_attributes_for :conta,  :update_only => true
  mount_uploader :foto, PictureUploader

  has_many :interesses_activos, class_name:  "Interesse",
                                  foreign_key: "interessado_em_id",
                                  dependent:   :destroy
  has_many :interessados, through: :interesses_activos, source: :interessado

  has_many :interesses_passivos, class_name:  "Interesse",
                                   foreign_key: "interessado_id",
                                   dependent:   :destroy
  has_many :interessados_em, through: :interesses_passivos, source: :interessado_em






  def interesse(objeto)
    interessados_em << objeto
  end

  def desinteresse(objeto)
    interessados_em.delete(objeto)
  end

  def interessados?(objeto)
    interessados_em.include?(objeto)
  end
end
