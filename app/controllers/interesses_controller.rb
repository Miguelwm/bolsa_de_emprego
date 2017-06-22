class InteressesController < ApplicationController
  before_action :logged_in?

  def create
    @perfil = Perfil.find(params[:interessado_id])
    conta_atual.perfil.interesse(@perfil)

    if @perfil.entidade.nil?
      @candidato=@perfil.candidato
      respond_to do |format|
        format.html { redirect_to @candidato }
        format.js
      end
      elsif @perfil.candidato.nil?
        @entidade=@perfil.entidade
        respond_to do |format|
          format.html { redirect_to @entidade}
          format.js
        end
      end
  end

  def destroy
    @perfil = Interesse.find(params[:id]).interessado
    conta_atual.perfil.desinteresse(@perfil)

    if @perfil.entidade.nil?
      @candidato=@perfil.candidato
      respond_to do |format|
        format.html { redirect_to @candidato }
        format.js
      end
      elsif @perfil.candidato.nil?
        @entidade=@perfil.entidade
        respond_to do |format|
          format.html { redirect_to @entidade}
          format.js
        end
      end
  end
end
