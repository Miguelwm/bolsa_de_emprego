class NoticiasController < ApplicationController
  before_action :conta_logged_in, only: [:edit, :update]
  before_action :conta_admin,   only: [:edit, :update, :new, :update]

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
    if @noticia.update_attributes(noticia)
      redirect_to @noticia
    else
      render 'edit'
    end
  end

  private
    def noticia_params
      params.require(:noticia).permit( :titulo, :data, :sumario, :texto, :destaque, :activo)
    end

    def conta_admin
      redirect_to(root_url) unless conta_atual.try(:admin?)
    end
end
