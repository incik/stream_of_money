class InvoicesController < ApplicationController
  include Authenticable
  include ApiCommunicator

  def edit
    @invoice = Invoice.find(params[:id])
  end

end
