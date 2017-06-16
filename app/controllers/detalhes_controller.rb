class DetalhesController < ApplicationController

before_action :logged_in?


  def home
    if logged_in?
      if conta_atual.perfil.nil? && conta_atual.admin?
          redirect_to backhome_path
      end
      if !conta_atual.perfil.entidade.nil?
        #código candidato
      elsif !conta_atual.perfil.candidato.nil?
            @homecandidaturas = candidato_atual.candidaturas.last(2).to_a.reverse
            @homeinteresse= candidato_atual.perfil.interessados_em.last(2).to_a.reverse
        end
        else
            redirect_to root_url
        end
  end

  def showcandidaturas
    if is_entidade?
      redirect_to detalhes_path
    end
    @candidatura = candidato_atual.candidaturas
    @candidaturas = @candidatura.paginate(page: params[:page], per_page: 8)
  end

  def showinteressadas
    if is_entidade?
      redirect_to detalhes_path
    end
    @candidatos = candidato_atual.perfil.interessados_em
    @interessados = @candidatos.paginate(page: params[:page], per_page: 8)
  end

  def showofertasativas
    if is_candidato?
      redirect_to detalhes_path
    end
    @ofertas = entidade_atual.ofertas.where(activo:true)
    @ofertas_activas = @ofertas.paginate(page: params[:page], per_page: 8)
  end

  def showhistorico
    if is_candidato?
      redirect_to detalhes_path
    end
    @ofertas = entidade_atual.ofertas.where(activo:false)
    @ofertas_inativas = @ofertas.paginate(page: params[:page], per_page: 8)
  end

  def showinteressados
    if is_candidato?
      redirect_to detalhes_path
    end
    @candidatos = entidade_atual.perfil.interessados_em
    @interessados = @candidatos.paginate(page: params[:page], per_page: 8)
  end

  # def interessados_em
  #   @perfil = Perfil.find(params[:id])
  #   @perfils = @perfil.interessados_em.paginate(page: params[:page])
  #   render 'show_interessados'
  # end







end
