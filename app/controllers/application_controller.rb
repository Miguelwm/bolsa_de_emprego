class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  private
    def conta_logged_in
      unless logged_in?
        redirect_to  login_path
      end
    end

    def conta_admin
      redirect_to(root_url) unless conta_atual.try(:admin?)
    end
end
#@decodedVapidPublicKey = Base64.urlsafe_decode64("BOtI4qqTJ37dq6YQVDc8vkmcYFCLKdiLUr2jpZ0nYGBlXMHxcv0Ry3nUy72Ns0rPUS9wKxD8DT7Y5j-peKGfqcg=").bytes
#private_key=93fI0wfMAdpNkQ0YMTcssD-evMacpp5UF2j6HlTm-0A=
