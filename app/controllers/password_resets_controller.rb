class PasswordResetsController < ApplicationController
  before_action :buscar_conta,     only: [:edit, :update]
  before_action :conta_valida,     only: [:edit, :update]
  before_action :ver_expiracao,    only: [:edit, :update]

  def new
  end

  def create
    @conta = Conta.find_by(email: params[:password_reset][:email].downcase)
    if @conta
      @conta.criar_reset_digest
      @conta.enviar_password_reset_email
      flash[:info] = "Email enviado com instruções para a mudança de palavra-passe"
      redirect_to root_url
    else
      flash.now[:danger] = "Essa conta de email não está associada com nenhuma conta"
      render 'new'
    end
  end


  def edit
  end

  def update
    if params[:conta][:password].empty?
        render 'edit'
      elsif @conta.update_attributes(conta_params)
        log_in @conta
        @conta.update_attribute(:reset_digest, nil)
        flash[:success] = "A palavra-passe foi alterada."
        redirect_to @conta
      else
        render 'edit'
      end
  end



  private

  def conta_params
    params.require(:conta).permit(:password, :password_confirmation)
  end


  def buscar_conta
    @conta = Conta.find_by(email: params[:email])
  end

  def conta_valida
    unless(@conta && @conta.activo? && @conta.autenticado?(:reset, params[:id]))
      # flash[:danger] = "DEBUG!"
      redirect_to root_url
    end
  end

  def ver_expiracao
    if @conta.password_reset_expirada?
      flash[:danger] = "O seu pedido de alteração da palavra-passe expirou."
      redirect_to new_password_reset_url
    end
  end

end
