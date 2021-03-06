class OfertasController < ApplicationController
  before_action :conta_logged_in, only: [:edit, :update, :new, :create]
  before_action :conta_correcta,   only: [:edit, :update]

   def new
    @todas_areas = AreaProfissional.all
    @todos_tipos = TipoContrato.all
    @todos_salarios = Salario.all
    @oferta = Oferta.new
    @oferta.entidade = conta_atual.perfil.entidade
  end

  def create
    @oferta = conta_atual.perfil.entidade.ofertas.build(oferta_params)
    if @oferta.save
      Newsletter.oferta(@oferta)
      redirect_to detalhes_path
    else
      render 'new'
    end
  end

  def edit
    @todas_areas = AreaProfissional.all
    @todos_tipos = TipoContrato.all
    @todos_salarios = Salario.all
  end

  def update
    @oferta = Oferta.find(params[:id])
    if @oferta.update_attributes(oferta_params)
      redirect_to @oferta
    else
      render 'edit'
    end
  end

  def index
    if params[:search] && !params[:search].blank?
      if params[:searcharea] && !params[:searcharea].blank?
        @ofertas = Oferta.search(params[:search]).joins(:area_profissional).where("area_profissional_id = ?", params[:searcharea]).paginate(page: params[:page], per_page: 8)
      else
        @ofertas = Oferta.search(params[:search]).paginate(page: params[:page], per_page: 8)
      end
    elsif params[:searcharea] && !params[:searcharea].blank?
        @ofertas = Oferta.joins(:area_profissional).where("area_profissional_id = ?", params[:searcharea]).paginate(page: params[:page], per_page: 8)
    else
      @ofertas = Oferta.paginate(page: params[:page], per_page: 8)
    end
  end

  def show
    @oferta = Oferta.find(params[:id])
  end

  private
    def oferta_params
      params.require(:oferta).permit(:titulo, :val_inicio, :val_fim, :descricao,
                                    :area_profissional_id, :tipo_contrato_id,
                                    :salario_id ,:activo, :foto)
    end

    def conta_correcta
      @oferta = Oferta.find(params[:id])
      redirect_to(root_url) unless conta_atual?(@oferta.entidade.perfil.conta)
    end
end
