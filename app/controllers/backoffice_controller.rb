class BackofficeController < ApplicationController
  before_action :conta_admin
  layout 'backoffice'

  def home
  end
end
