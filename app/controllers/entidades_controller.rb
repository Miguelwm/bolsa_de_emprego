class EntidadesController < ApplicationController

  def new
    @todas_actividades = ActividadeProfissional.all
    @entidade = Entidade.new
    @entidade.build_perfil.build_conta
  end

  def create
    @entidade = Entidade.new(entidade_params)
    if @entidade.save
      debugger
      redirect_to root_url
    else
      render new
    end
  end

  private
    def entidade_params
      params.require(:entidade).permit( :nif, :actividade_profissional_id ,perfil_attributes: [:foto, :morada, :codigo_postal,:localidade,
                    :contacto1, :contacto2, :pagina, :apresentacao,
                    conta_attributes: [:nome, :email,:password,
                    :password_confirmation]])
    end
end
