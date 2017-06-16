class Conta < ApplicationRecord

  attr_accessor :lembrar_token, :activacao_token, :reset_token
  before_save   :downcase_email
  before_create :criar_activo_digest


  has_one :perfil, :inverse_of => :conta ,dependent: :destroy
  has_many :noticias, :inverse_of =>:conta ,dependent: :destroy
  accepts_nested_attributes_for :perfil, allow_destroy: true, :update_only => true


  validates :nome, presence: true, length: { maximum: 50, minimum: 2}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true, on: :update, allow_blank: true;

  def Conta.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Conta.novo_token
    SecureRandom.urlsafe_base64
  end

  def novo_token
    SecureRandom.urlsafe_base64
  end

  def lembrar
    self.lembrar_token = Conta.novo_token
    update_attribute(:lembrar_digest, Conta.digest(lembrar_token))
  end

  def autenticado?(attributo, token)
    digest = send("#{attributo}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def esquecer
    update_attribute(:lembrar_digest, nil)
  end

  def ativar
    update_columns(activo: true, ativado_em: Time.zone.now)
  end

  def mandar_email_ativacao
    ContasMailer.conta_ativacao(self).deliver_now
  end

  def criar_reset_digest
    self.reset_token = Conta.novo_token
    update_columns(reset_digest: Conta.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  def enviar_password_reset_email
    ContasMailer.password_reset(self).deliver_now
  end

  def password_reset_expirada?
    reset_sent_at < 2.hours.ago
  end

  def self.search(search)
    search=search.downcase
    where("LOWER(nome) LIKE ? ", "%#{search}%")
  end


 private

  def downcase_email
    email.downcase!
  end

  def criar_activo_digest
    self.activacao_token = Conta.novo_token
    self.activo_digest = Conta.digest(activacao_token)
  end


end
