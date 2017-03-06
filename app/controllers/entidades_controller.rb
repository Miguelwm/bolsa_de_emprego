class EntidadesController < ApplicationController
  before_action :logged_in_entidade, only: [:edit, :update]
  before_action :contas_correcta,   only: [:edit, :update]

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

  private
    def entidade_params
      params.require(:entidade).permit( :nif, :actividade_profissional_id ,
                    perfil_attributes: [:foto, :morada, :codigo_postal,:localidade,
                    :contacto1, :contacto2, :pagina, :apresentacao,
                    conta_attributes: [:nome, :email,:password,
                    :password_confirmation]])
    end

    def logged_in_entidade
      unless logged_in?
        redirect_to frontoffice_login_path
      end
    end


    def contas_correcta
      @entidade = Entidade.find(params[:id])
      redirect_to(root_url) unless conta_atual?(@entidade.perfil.conta)
    end
end
