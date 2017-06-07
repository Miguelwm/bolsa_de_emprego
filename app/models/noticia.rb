class Noticia < ApplicationRecord
  belongs_to :conta, :inverse_of =>:noticias
end
