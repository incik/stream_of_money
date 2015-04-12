class InvoiceLine < ApiResource

  # seems that there's no way how to get invoice ID into instance of this class
  # so we must botch it like this :/
  def expense(invoice_id)
    Expense.where(invoice_id: invoice_id, description: self.description).first
  end

  def expense_cost(invoice_id)
    expense(invoice_id).nil? ? 0 : expense(invoice_id).expense
  end

  def total_amount
    quantity * unit_price
  end

  def earnings(invoice_id)
    total_amount - expense_cost(invoice_id)
  end

end
