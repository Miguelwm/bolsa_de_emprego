class BackofficeController < ApplicationController
  before_action :conta_admin
  layout 'backoffice'


  def home
    if Conta.where(tipo:"Candidato").where(novo:true).any? || Conta.where(tipo:"Entidade").where(novo:true).any? || Oferta.where(novo:true).any?
      @class_params="btn btn-primary"
    else
      @class_params="btn btn-primary disabled"
    end    
  end

  def newsletter
    Newsletter.newsletter
    redirect_to backhome_path
  end


end
