class SessionsController < ApplicationController
  def new
  end

  def create
    if !logged_in?
      conta = Conta.find_by(email: params[:session][:email].downcase)
      if conta && conta.authenticate(params[:session][:password])
        log_in conta
        if(conta.admin?)
          redirect_to backhome_path
        else
          redirect_to root_url
        end
      else
        flash.now[:danger] = "Combinação inválida de email e palavra passe"
        render 'new'
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
