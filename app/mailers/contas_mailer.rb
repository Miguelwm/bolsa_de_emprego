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

end
