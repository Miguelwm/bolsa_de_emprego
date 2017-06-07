module EntidadesHelper
  def num_ofertas_activas(entidade)
    entidade.ofertas.where(activo:true).count
  end

  def ofertas_activas(entidade)
    entidade.ofertas.where(activo:true)
  end
end
