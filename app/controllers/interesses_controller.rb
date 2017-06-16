class InteressesController < ApplicationController
  before_action :logged_in?

  def create
    @perfil = Perfil.find(params[:interessado_id])
    conta_atual.perfil.interesse(@perfil)

    if @perfil.entidade.nil?
      redirect_to @perfil.candidato
      elsif @perfil.candidato.nil?
        redirect_to @perfil.entidade
    end
  end

  def destroy
    perfil = Interesse.find(params[:id]).interessado
    conta_atual.perfil.desinteresse(perfil)

    redirect_to root_url
  end
end
