class CandidatosController < ApplicationController

  def new
    @todas_areas = AreaProfissional.all
    @todas_habilitacoes = NivelHabilitacao.all
    @todas_situacoes = SituacaoProfissional.all
    @candidato = Candidato.new
    @candidato.build_perfil.build_conta
  end

  def create
    @candidato = Candidato.new(candidato_params)
    if @candidato.save
      redirect_to root_url
    else
      render new
    end
  end

  def edit
    @todas_areas = AreaProfissional.all
    @todas_habilitacoes = NivelHabilitacao.all
    @todas_situacoes = SituacaoProfissional.all
    @candidato = Candidato.find(params[:id])
  end

  def update
    @candidato = Candidato.find(params[:id])
    if @candidato.update_attributes(candidato_params)
      redirect_to @candidato
    else
      render 'edit'
    end
  end

  private
    def candidato_params
      params.require(:candidato).permit(:nascimento, :bi, :cv, :area_profissional_id,
                    :nivel_habilitacao_id, :habilitacao, :situacao_profissional_id,
                    :experiencia ,perfil_attributes: [:foto, :morada,
                    :codigo_postal,:localidade, :contacto1, :contacto2,
                    :pagina, :apresentacao, conta_attributes: [:nome, :email,
                    :password, :password_confirmation]])
    end

end
