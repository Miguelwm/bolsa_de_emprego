# Preview all emails at http://localhost:3000/rails/mailers/contas_mailer
class ContasMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contas_mailer/account_activation
  def conta_activacao
    conta=Conta.second
    conta.activacao_token = Conta.novo_token
    ContasMailer.conta_ativacao(conta)
  end

  # Preview this email at http://localhost:3000/rails/mailers/contas_mailer/password_reset
  def password_reset
    conta=Conta.second
    conta.reset_token = Conta.novo_token
    ContasMailer.password_reset(conta)
  end

  def newsletter
    conta=Conta.second
    ContasMailer.newsletter(conta)
  end

end
