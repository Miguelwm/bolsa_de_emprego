class ContasMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contas_mailer.account_activation.subject
  #
  def conta_ativacao(conta)
    @conta = conta
    mail to: conta.email, subject: "Ativação de conta"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contas_mailer.password_reset.subject
  #
  def password_reset(conta)
    @conta = conta
    mail to: conta.email, subject: "Palavra-passe perdida"
  end


  def newsletter(conta)
    mail to: conta.email, subject: "Bolsa de Emprego - Newsletter semanal"
  end

  def candidato(conta,candidato)
    @candidato=candidato
    mail to: conta.email, subject: "Novo candidato - #{candidato.nome}"
  end

  def entidade(conta,entidade)
    @entidade=entidade
    mail to: conta.email, subject: "Nova entidade - #{entidade.nome}"
  end

  def oferta(conta,oferta)
    @oferta=oferta
    mail to: conta.email, subject: "Nova oferta - #{oferta.titulo}"
  end

  def candidatura(oferta,candidato)
    @oferta=oferta
    @candidato=candidato
    mail to: oferta.entidade.perfil.conta.email, subject: "Nova candidatura - #{oferta.titulo}"
  end

end
