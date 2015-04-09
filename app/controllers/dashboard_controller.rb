class DashboardController < ApplicationController
  include Authenticable
  include ApiCommunicator

  def index
    @invoices = Invoice.all
  end
end
