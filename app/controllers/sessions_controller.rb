class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
    if !logged_in?
      conta = Conta.find_by(email: params[:session][:email].downcase)
      if conta && conta.authenticate(params[:session][:password])
        if conta.activo?
          log_in conta
          params[:session][:lembrar_me] == '1' ? lembrar(conta) : esquecer(conta)
          if(conta.admin?)
            redirect_to backhome_path
          else
            # flash[:warning]= "Debug!"
            redirect_to detalhes_path
          end
        else
          message = "Conta não ativada. "
          message += "Verifique o seu email para o link de ativação"
          flash[:warning] = message
          redirect_to root_url
        end
      else
        flash.now[:danger] = "Combinação inválida de email e palavra passe"
        render 'new'
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
