require 'active_resource'

class Invoice < ActiveResource::Base
  def self.set_api_credentials(params)
    self.site = params[:site]
    self.user = params[:user]
    self.password = params[:password]
    self.format = :xml
  end

  def expenses
    Expense.where(invoice_id: self.id)
  end

  def expenses_cost
    expenses.inject(0) { |sum, expense| sum + expense.expense }
  end

  def result_cost
    total_amount - expenses_cost
  end

end
