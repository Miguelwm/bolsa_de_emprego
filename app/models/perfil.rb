class Perfil < ApplicationRecord
  belongs_to :conta, :inverse_of => :perfil
  validates_presence_of :conta
  has_one :entidade, :inverse_of => :perfil ,dependent: :destroy
  has_one :candidato, :inverse_of => :perfil ,dependent: :destroy
  accepts_nested_attributes_for :entidade, allow_destroy: true
  accepts_nested_attributes_for :candidato, allow_destroy: true
  accepts_nested_attributes_for :conta,  :update_only => true
  mount_uploader :foto, PictureUploader
  validates :foto, presence:true, allow_blank:false

  has_many :interesses_activos, class_name:  "Interesse",
                                  foreign_key: "interessado_em_id",
                                  dependent:   :destroy

  has_many :interesses_passivos, class_name:  "Interesse",
                                 foreign_key: "interessado_id",
                                 dependent:   :destroy

  has_many :interessados, through: :interesses_activos, source: :interessado #Following
  has_many :interessados_em, through: :interesses_passivos, source: :interessado_em #Followers







  def interesse(objeto)
    interessados << objeto
  end

  def desinteresse(objeto)
    interessados.delete(objeto)
  end

  def interessados?(objeto)
    interessados.include?(objeto)
  end
end
