class ContasController < ApplicationController
  before_action :conta_admin
  layout 'backoffice'

  def new
    @conta = Conta.new
  end

  def create
    @conta = Conta.new(conta_params)
    @conta.admin = true
    @conta.password = "BolsaAdmin"
    @conta.password_confirmation ="BolsaAdmin"
    @conta.tipo = "Backoffice"
    if @conta.save
      @conta.ativar
      redirect_to utilizadores_path
    else
      render 'new'
    end
  end

  def index
    if params[:search] && !params[:search].blank?
      if params[:searchtipo] && !params[:searchtipo].blank?
        @todas_contas = Conta.where(tipo:params[:searchtipo]).search(params[:search])
      else
        @todas_contas = Conta.search(params[:search])
      end
    elsif params[:searchtipo] && !params[:searchtipo].blank?
        @todas_contas = Conta.where(tipo:params[:searchtipo])
    else
      @todas_contas = Conta.all
    end
  end

  def edit
    @conta = Conta.find(params[:id])
  end

  def update
    @conta = Conta.find(params[:id])


    if conta_params[:destaque]=1
        Conta.where(destaque:true).where(tipo:@conta.tipo).each do |contas|
          if contas!=@conta
          contas.update_attribute(:destaque, false)
          end
        end
    end


    if @conta.update_attributes(conta_params)
      redirect_to @conta
    else
      render 'edit'
    end
  end

  def show
    @conta = Conta.find(params[:id])
  end

  def destroy
    @conta = Conta.find(params[:id]).destroy
    flash[:success] = "A conta " + @conta.nome + " foi eliminada com sucesso"
    redirect_to contas_path
  end

  def edit_password
    @conta = Conta.find(params[:id])
  end

  def update_password
    @conta = Conta.find(params[:id])
    if @conta.update_attributes(conta_params)
      redirect_to @conta
    else
      render 'edit_password'
    end
  end


  private
    def conta_params
      params.require(:conta).permit( :nome ,:email ,:activo ,:password,
                                    :password_confirmation, :tipo, :destaque)
    end


end
