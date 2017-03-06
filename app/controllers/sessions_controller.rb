class SessionsController < ApplicationController
  def new
  end

  def create
    conta = Conta.find_by(email: params[:session][:email].downcase)
    if conta && conta.authenticate(params[:session][:password])
      log_in conta
      if(conta.perfil.entidade == nil)
        redirect_to conta.perfil.candidato
      else
        redirect_to conta.perfil.entidade
      end
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
