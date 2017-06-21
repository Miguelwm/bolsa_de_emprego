class AccountActivationnsController < ApplicationController


  def edit
    conta = Conta.find_by(email: params[:email])
    if !conta.nil? && !conta.activo? && conta.autenticado?(:activo, params[:id])
      conta.ativar
      log_in conta
      Newsletter.novo(conta)
      flash[:success] = "Conta ativada com sucesso!"
      redirect_to root_url
    else
      flash[:danger] = "Link de ativação inválida!"
      redirect_to root_url
    end
  end

end
