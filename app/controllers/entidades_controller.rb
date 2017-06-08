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
    if @entidade.save
      log_in @entidade.perfil.conta
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
    @entidades = Entidade.paginate(page: params[:page], per_page: 8)
  end

  def show
    @entidade = Entidade.find(params[:id])
  end


  private
    def entidade_params
      params.require(:entidade).permit( :nif, :actividade_profissional_id ,
                    perfil_attributes: [:foto, :morada, :codigo_postal,:localidade,
                    :contacto1, :contacto2, :pagina, :apresentacao,
                    conta_attributes: [:nome, :email,:password,
                    :password_confirmation]])
    end



    def conta_correcta
      @entidade = Entidade.find(params[:id])
      redirect_to(root_url) unless conta_atual?(@entidade.perfil.conta)
    end
end
