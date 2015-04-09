class CreateInvoiceItemExpense < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :invoice_id
      t.integer :line_index
      t.decimal :expense, precision: 10, scale: 2
    end
  end
end
