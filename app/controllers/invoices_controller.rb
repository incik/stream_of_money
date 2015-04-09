class InvoicesController < ApplicationController
  include Authenticable
  include ApiCommunicator

  def edit
    @invoice = Invoice.find(params[:id])
    @expenses = @invoice.expenses
    @rows = []
    @invoice.lines.each_with_index do |line, index|
      @rows << OpenStruct.new({
        description: line.description,
        quantity:    line.quantity,
        unit_price:  line.unit_price,
        vat:         line.vat,
        expenses:    @expenses[index] ? @expenses[index].expense : 0
      })
    end
  end

end
