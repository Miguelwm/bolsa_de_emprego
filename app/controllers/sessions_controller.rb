class SessionsController < ApplicationController
  def new
  end

  def create
    conta = Conta.find_by(email: params[:session][:email].downcase)
    if conta && conta.authenticate(params[:session][:password])
      log_in conta
      redirect_to conta.perfil.entidade
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
