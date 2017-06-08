class FrontofficeController < ApplicationController
  def home
    @ultimas_ofertas = Oferta.last(3).to_a.reverse
    @ultimas_noticias = Noticia.last(3).to_a.reverse
    @ultimas_entidades = Entidade.last(3).to_a.reverse
    @ultimos_candidatos = Candidato.last(3).to_a.reverse
  end

  def new
  end

  def index_noticias
    @frontoffice = Noticia.paginate(page: params[:page], per_page: 8)
  end

  def show_noticia
    @noticia = Noticia.find(params[:id])
  end

end
