class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    def conta_logged_in
      unless logged_in?
        redirect_to frontoffice_login_path
      end
    end
end
