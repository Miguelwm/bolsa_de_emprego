class CandidaturasController < ApplicationController
  before_action :is_candidato?

  def create
    @oferta = Oferta.find(params[:oferta_id])
    Newsletter.candidatura(@oferta,conta_atual)
    candidato_atual.candidatar(@oferta)

    respond_to do |format|
      format.html { redirect_to @oferta }
      format.js
    end
  end
end
