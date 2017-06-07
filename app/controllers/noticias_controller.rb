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

  def index
    @todas_noticias = Noticia.all
  end

  def show
    @noticia = Noticia.find(params[:id])
  end

  private
    def noticia_params
      params.require(:noticia).permit( :titulo, :data, :sumario, :texto, :destaque, :activo)
    end
end
