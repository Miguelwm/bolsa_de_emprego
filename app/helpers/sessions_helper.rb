module SessionsHelper
  def log_in(conta)
    session[:conta_id] = conta.id
  end


  def conta_atual?(conta)
    conta == conta_atual
  end

  def conta_atual
    @conta_atual ||= Conta.find_by(id: session[:conta_id])
  end

  def logged_in?
    !conta_atual.nil?
  end

  def log_out
    session.delete(:conta_id)
    @conta_atual = nil
  end
end
