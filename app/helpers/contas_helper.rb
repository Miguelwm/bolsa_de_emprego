module ContasHelper

  def tipo_conta(conta)
    if(conta.perfil == nil)
        tipo = "Backoffice"
      else
        if(conta.perfil.entidade == nil)
          tipo = "Candidato"
        else
          tipo = "Entidade"
        end
      end
  end

  def actividade_conta(conta)
    if(conta.activo?)
      activo = "Sim"
    else
      activo = "Não"
    end
  end

end
