module OfertasHelper
  def ofertas_mesma_area(oferta)
    Oferta.all.where(area_profissional_id:oferta.area_profissional_id).where(activo:true).where.not(id:oferta.id)
  end
end
