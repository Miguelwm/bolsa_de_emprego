class FrontofficeController < ApplicationController
  def home
    @ultimas_ofertas = Oferta.where(activo:true).last(3).to_a.reverse
    @ultimas_noticias = Noticia.where(activo:true).where(destaque:true).last(3).to_a.reverse
    @ultimas_entidades = Entidade.last(3).to_a.reverse
    @ultimos_candidatos = Candidato.last(3).to_a.reverse
  end

  def new
  end

  def front
    redirect_to root_url
  end

  def index_noticias

    if params[:search] && !params[:search].blank?
      @frontoffice = Noticia.search(params[:search]).paginate(page: params[:page], per_page: 8)
    else
      @frontoffice = Noticia.paginate(page: params[:page], per_page: 8)
    end
  end

  def show_noticia
    @noticia = Noticia.find(params[:id])
  end

end
