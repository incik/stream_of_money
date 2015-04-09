class DashboardController < ApplicationController
  include Authenticable
  include ApiCommunicator

  def index
    Invoice.set_api_credentials site: "https://#{current_user.billapp_agenda}.billapp.cz", user: current_user.billapp_user, password: current_user.billapp_password
    @invoices = Invoice.all
  end
end
