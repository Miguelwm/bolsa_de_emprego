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
      redirect_to root_url
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
    @todas_entidades = Entidade.paginate(page: params[:page], per_page: 8)
  end

  def index
    @ofertas = Oferta.paginate(page: params[:page], per_page: 8)
  end

  def show
    @oferta = Oferta.find(params[:id])
  end

  private
    def oferta_params
      params.require(:oferta).permit(:titulo, :val_inicio, :val_fim, :descricao,
                                    :area_profissional_id, :tipo_contrato_id,
                                    :salario_id ,:activo)
    end

    def conta_correcta
      @oferta = Oferta.find(params[:id])
      redirect_to(root_url) unless conta_atual?(@oferta.entidade.perfil.conta)
    end
end
