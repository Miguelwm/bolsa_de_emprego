class CandidatosController < ApplicationController
  before_action :conta_logged_in, only: [:edit, :update]
  before_action :conta_correcta,   only: [:edit, :update]

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
      log_in @candidato.perfil.conta
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

  def index
    @candidatos = Candidato.paginate(page: params[:page], per_page: 8)
  end

  def show
    @candidato = Candidato.find(params[:id])
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

    def conta_correcta
      @candidato = Candidato.find(params[:id])
      redirect_to(root_url) unless conta_atual?(@candidato.perfil.conta)
    end

end
