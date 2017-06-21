class EntidadesController < ApplicationController
  before_action :conta_logged_in, only: [:edit, :update]
  before_action :conta_correcta,   only: [:edit, :update]

  def new
    @todas_actividades = ActividadeProfissional.all
    @entidade = Entidade.new
    @entidade.build_perfil.build_conta
  end

  def create
    @entidade = Entidade.new(entidade_params)
    @entidade.perfil.conta.tipo = "Entidade"
    if @entidade.save
      @entidade.perfil.conta.mandar_email_ativacao
      flash[:info] = "Por favor verifique o seu email para ativar a sua conta"
      redirect_to root_url
    else

      render 'new'
    end
  end

  def edit
    @todas_actividades = ActividadeProfissional.all
    @entidade = Entidade.find(params[:id])
  end

  def update
    @entidade = Entidade.find(params[:id])
    if @entidade.update_attributes(entidade_params)
      redirect_to @entidade
    else
      render 'edit'
    end
  end

  def index
    if params[:search] && !params[:search].blank?
      if params[:searchactividade] && !params[:searchactividade].blank?
        @entidades = Conta.where(tipo:"Entidade").search(params[:search]).joins(perfil: :entidade).where("actividade_profissional_id = ?", params[:searchactividade]).paginate(page: params[:page], per_page: 8)
      else
        @entidades = Conta.where(tipo:"Entidade").search(params[:search]).paginate(page: params[:page], per_page: 8)
      end
    elsif params[:searchactividade] && !params[:searchactividade].blank?
          @entidades = Conta.where(tipo:"Entidade").joins(perfil: :entidade).where("actividade_profissional_id = ?", params[:searchactividade]).paginate(page: params[:page], per_page: 8)
    else
      @entidades = Conta.where(tipo:"Entidade").paginate(page: params[:page], per_page: 8)
    end
  end

  def show
    @entidade = Entidade.find(params[:id])
    @ofertas=ofertas_activas(@entidade).paginate(page:params[:page],per_page:4)
  end


  private
    def entidade_params
      params.require(:entidade).permit( :nif, :actividade_profissional_id ,
                    perfil_attributes: [:foto, :morada, :codigo_postal,:localidade,
                    :contacto1, :contacto2, :pagina, :apresentacao,
                    conta_attributes: [:nome, :email,:password,
                    :password_confirmation, :tipo, :candidatos, :candidaturas, :newsletter]])
    end

    def ofertas_activas(entidade)
      entidade.ofertas.where(activo:true)
    end


    def conta_correcta
      @entidade = Entidade.find(params[:id])
      redirect_to(root_url) unless conta_atual?(@entidade.perfil.conta)
    end
end
