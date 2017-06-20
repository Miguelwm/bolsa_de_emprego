class Noticia < ApplicationRecord
  belongs_to :conta, :inverse_of =>:noticias
  mount_uploader :foto, PictureUploader

  validates :foto, presence:true, allow_blank:false
  validates :titulo, presence:true, allow_blank:false
  validates :data, presence:true, allow_blank:false
  validates :texto, presence:true, allow_blank:false
  validates :sumario, presence:true, allow_blank:false



  def self.search(search)
    search=search.downcase.gsub(/\s+/, "%")
    where("LOWER(titulo) LIKE ? OR LOWER(sumario) LIKE ? OR LOWER(texto) LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end

end
