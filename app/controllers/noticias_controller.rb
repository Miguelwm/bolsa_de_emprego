class NoticiasController < ApplicationController
  before_action :conta_admin

  layout 'backoffice'

  def new
    @noticia = Noticia.new
    @noticia.conta = conta_atual
  end

  def create
    @noticia = conta_atual.noticias.build(noticia_params)
    if @noticia.save
      redirect_to @noticia
    else
      render 'new'
    end
  end

  def edit
    @noticia = Noticia.find(params[:id])
  end

  def update
    @noticia = Noticia.find(params[:id])
    if @noticia.update_attributes(noticia_params)
      redirect_to @noticia
    else
      render 'edit'
    end
  end

  def destroy
    @noticia = Noticia.find(params[:id]).destroy
    flash[:success] = "A noticia " + @noticia.titulo + " foi eliminada com sucesso"
    redirect_to noticias_path
  end

  def index
    if params[:search] && !params[:search].blank?
      @todas_noticias = Noticia.search(params[:search])
    else
      @todas_noticias = Noticia.all
    end
  end

  def show
    @noticia = Noticia.find(params[:id])
  end

  private
    def noticia_params
      params.require(:noticia).permit( :titulo, :data, :sumario, :texto, :destaque, :activo, :foto)
    end
end
