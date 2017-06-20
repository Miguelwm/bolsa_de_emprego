class AlterarPasswordController < ApplicationController
  before_action :buscar_conta,     only: [:edit, :update]
  before_action :conta_valida,     only: [:edit, :update]

  def home
    redirect_to edit_alterar_password_path(conta_atual)
  end

  def edit
  end

  def update


    if BCrypt::Password.new(@conta.password_digest).is_password?(params[:conta][:passwordantiga])
      if params[:conta][:password].empty?
          flash[:danger]= "A palavra passe não pode ser vazia"
          render 'edit'
        elsif @conta.update_attributes(conta_params)
          flash[:success] = "A palavra-passe foi alterada."
          redirect_to detalhes_path
        else
          flash[:danger]= "As palavras passes não são iguais."
          render 'edit'
        end
    else
      flash[:danger]= "Palavra passe atual errada"
      render 'edit'
    end

  end



  private

  def conta_params
    params.require(:conta).permit(:password, :password_confirmation)
  end

  def buscar_conta
    @conta = Conta.find_by(id: params[:id])
  end

  def conta_valida
    unless conta_atual==@conta
      redirect_to root_url
    end
  end


end
