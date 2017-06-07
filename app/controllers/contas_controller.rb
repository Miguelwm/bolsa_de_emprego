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
    if @conta.save
      redirect_to utilizadores_path
    else
      render 'new'
    end
  end

  def index
    @todas_contas = Conta.all
  end

  def edit
    @conta = Conta.find(params[:id])
  end

  def update
    @conta = Conta.find(params[:id])
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
                                    :password_confirmation)
    end


end
