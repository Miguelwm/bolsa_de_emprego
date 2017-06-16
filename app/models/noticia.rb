class Noticia < ApplicationRecord
  belongs_to :conta, :inverse_of =>:noticias
  mount_uploader :foto, PictureUploader


  def self.search(search)
    search=search.downcase
    where("LOWER(titulo) LIKE ? OR LOWER(sumario) LIKE ? OR LOWER(texto) LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end

end
