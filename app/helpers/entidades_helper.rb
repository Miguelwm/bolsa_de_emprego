module EntidadesHelper
  def num_ofertas_activas(entidade)
    entidade.ofertas.where(activo:true).count
  end

  def interesse(perfil)
    perfil.perfil.interessados_em
  end

  def homeinteresse(entidade)
    interesse(entidade).last(2).to_a.reverse
  end

  def homeofertas_activas(entidade)
    ofertas_activas(entidade).last(2).to_a.reverse
  end

  def ofertas_activas(entidade)
    entidade.ofertas.where(activo:true)
  end

  def ofertas_inativas(entidade)
    entidade.ofertas.where(activo:false)
  end

  def homeofertas_inativas(entidade)
    ofertas_inativas(entidade).last(2).to_a.reverse
  end
  #
  # def oferta_candidatos(oferta)
  #   oferta.candidatos.last(2).to_a.reverse
  # end

# @homeofertas = entidade_atual.ofertas.last(2).to_a.reverse

end
