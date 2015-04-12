class InvoiceLine < ApiResource
  belongs_to :invoice

  # seems that there's no way how to get invoice ID into instance of this class
  # so we must botch it like this :/
  def expenses(invoice_id)
    @exp = Expense.find_by_invoice_id_and_description(invoice_id, description)
    @exp.try(:expense) || 0
  end
end
