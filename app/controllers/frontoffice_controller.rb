class FrontofficeController < ApplicationController
  def home
    @ultimas_ofertas = Oferta.where(activo:true).last(3).to_a.reverse
    @ultimas_entidades = Entidade.last(3).to_a.reverse
    @ultimos_candidatos = Candidato.last(3).to_a.reverse

    @noticias_destaque = Noticia.where(activo:true).where(destaque:true).last(3).to_a.reverse
    @candidatos_destaque= Conta.where(tipo:"Candidato").where(destaque:true).to_a.reverse
    @entidades_destaque= Conta.where(tipo:"Entidade").where(destaque:true).to_a.reverse

    @idprimeiro=0
    primeiro=0

    @idsegundo=0
    segundo=0

    @idterceiro=0
    terceiro=0


    Oferta.where(activo:true).each do |oferta|
      x=oferta.candidatos.count
      if x > primeiro
        terceiro=segundo
        @idterceiro=@idsegundo

        segundo=primeiro
        @idsegundo=@idprimeiro

        primeiro=x
        @idprimeiro=oferta.id
      elsif x > segundo
        terceiro=segundo
        @idterceiro=@idsegundo

        segundo=x
        @idsegundo=oferta.id
      elsif x > terceiro
        terceiro=x
        @idterceiro=oferta.id
      end
    end

    Webpush.payload_send webpush_params

    head :ok
  end

  def new
  end

  def front
    redirect_to root_url
  end

  def index_noticias

    if params[:search] && !params[:search].blank?
      @frontoffice = Noticia.search(params[:search]).paginate(page: params[:page], per_page: 8)
    else
      @frontoffice = Noticia.paginate(page: params[:page], per_page: 8)
    end
  end

  def show_noticia
    @noticia = Noticia.find(params[:id])
  end


  private

  def webpush_params
    subscription_params = fetch_subscription
    message = "Hello world, the time is #{Time.zone.now}"
    endpoint = subscription_params[:endpoint],
    p256dh = subscription_params.dig(:keys, :p256dh)
    auth = subscription_params.dig(:keys, :auth)
    api_key = 'AIzaSyAjrhMQ9zh_7UD4VVsxH0dg_Tb3HXl-VoA'

    { message: message, endpoint: endpoint, p256dh: p256dh, auth: auth, api_key: api_key }
  end

  def fetch_subscription
    encoded_subscription = session.fetch(:subscription) do
      raise "Cannot create notification: no :subscription in params or session"
    end

    JSON.parse(Base64.urlsafe_decode64(encoded_subscription)).with_indifferent_access
  end

end
