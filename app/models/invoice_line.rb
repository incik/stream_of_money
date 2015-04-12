class InvoiceLine < ApiResource

  # seems that there's no way how to get invoice ID into instance of this class
  # so we must botch it like this :/
  def expenses(invoice_id)
    Expense.where(invoice_id: invoice_id, description: self.description)
  end

  def expenses_cost(invoice_id)
    expenses(invoice_id).inject(0) { |sum, expense| sum + expense.expense }
  end
end
