class CandidaturasController < ApplicationController
  before_action :is_candidato?

  def create
    oferta = Oferta.find(params[:oferta_id])
    candidato_atual.candidatar(oferta)
    redirect_to oferta
  end
end
