class Newsletter < ApplicationRecord


  def self.newsletter
    @contas=Conta.all
    @ofertas=Oferta.all
    Conta.where(newsletter:true).each do |conta|
      ContasMailer.newsletter(conta).deliver_now
    end
    @contas.each do |conta|
        conta.update_attribute(:novo, false)
    end
    @ofertas.each do |oferta|
      oferta.update_attribute(:novo, false)
    end
  end

  def self.novo(conta)
    @conta=conta
      if @conta.tipo=="Entidade"
        Conta.where(entidades:true).each do |conta|
          ContasMailer.entidade(conta,@conta).deliver_now
        end
      elsif @conta.tipo=="Candidato"
        Conta.where(candidatos:true).each do |conta|
          ContasMailer.candidato(conta,@conta).deliver_now
        end
      end
  end

  def self.oferta(oferta)
    @candidatos=Conta.where(ofertas:true)
    @candidatos.each do |candidato|
      ContasMailer.oferta(candidato,oferta).deliver_now
    end
  end

  def self.candidatura(oferta,conta)
    if oferta.entidade.perfil.conta.candidaturas?
      ContasMailer.candidatura(oferta,conta).deliver_now
    end
  end

end
