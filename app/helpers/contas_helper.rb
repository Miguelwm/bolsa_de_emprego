module ContasHelper

  def tipo_conta(conta)
    conta.tipo
  end

  def actividade_conta(conta)
    if(conta.activo?)
      activo = "Sim"
    else
      activo = "Não"
    end
  end

  def destaque_conta(conta)

    if conta.admin?
      "-----"
    end


    if conta.destaque?
      "Sim"
    else
      "Não"
    end
  end

end
