module SessionsHelper
  def log_in(conta)
    session[:conta_id] = conta.id
  end

  def lembrar(conta)
    conta.lembrar
    cookies.permanent.signed[:conta_id] = conta.id
    cookies.permanent[:lembrar_token] = conta.lembrar_token
  end

  def conta_atual?(conta)
    conta == conta_atual
  end

  def conta_atual
    if (conta_id = session[:conta_id])
      @current_conta ||= Conta.find_by(id: conta_id)
    elsif (conta_id = cookies.signed[:conta_id])
      conta = Conta.find_by(id: conta_id)
      if conta && conta.autenticado?(:lembrar, cookies[:lembrar_token])
        log_in conta
        @current_conta = conta
      end
    end
  end

  def esquecer(conta)
    conta.esquecer
    cookies.delete(:conta_id)
    cookies.delete(:lembrar_token)
  end

  def logged_in?
    !conta_atual.nil?
  end

  def is_candidato?
    if !conta_atual.perfil.nil?
      !conta_atual.perfil.candidato.nil?
    end
  end

  def candidato_atual
    if !conta_atual.perfil.nil?
      conta_atual.perfil.candidato
    end
  end

  def is_entidade?
    if !conta_atual.perfil.nil?
      !conta_atual.perfil.entidade.nil?
    end
  end

  def entidade_atual
    if !conta_atual.nil? && !conta_atual.perfil.nil?
      conta_atual.perfil.entidade
    end
  end

  def log_out
    esquecer(conta_atual)
    session.delete(:conta_id)
    @conta_atual = nil
  end

end
