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




end
