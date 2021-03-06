class Oferta < ApplicationRecord
  belongs_to :entidade
  belongs_to :area_profissional
  belongs_to :tipo_contrato
  belongs_to :salario
  mount_uploader :foto, PictureUploader
  validates :foto, presence:true, allow_blank:false

  has_many :candidaturas, class_name:  "Candidatura",
                                   foreign_key: "oferta_id",
                                   dependent:   :destroy
  has_many :candidatos, through: :candidaturas, source: :candidato




  def self.search(search)
    search=search.downcase.gsub(/\s+/, "%")
    where("LOWER(titulo) LIKE ? ", "%#{search}%")
  end

end
