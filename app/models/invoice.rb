class Invoice < ApiResource
  has_many :lines, class_name: InvoiceLine

  def expenses
    Expense.where(invoice_id: self.id)
  end

  def expenses_cost
    expenses.inject(0.0) { |sum, expense| sum + expense.expense }
  end

  def earnings
    total_amount - expenses_cost
  end

end
