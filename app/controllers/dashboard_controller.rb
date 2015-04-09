class DashboardController < ApplicationController
  include Authenticable
  include ApiCommunicator

  def index
    Invoice.set_api_credentials current_user.api_credentials
    @invoices = Invoice.all
  end
end
