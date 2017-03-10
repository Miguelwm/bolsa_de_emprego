class InteressesController < ApplicationController
  before_action :logged_in?

  def create
    perfil = Perfil.find(params[:interessado_em_id])
    conta_atual.perfil.interesse(perfil)
    redirect_to root_url
  end

  def destroy
    perfil = Perfil.find(params[:id]).interessado
    conta_atual.perfil.desinteresse(perfil)
    redirect_to root_url
  end
end
