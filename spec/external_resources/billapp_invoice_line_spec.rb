require 'spec_helper'

describe 'invoice line resource' do

  describe 'user has at least one invoice' do

    before do
      webmock_1_invoice
      [Invoice, InvoiceLine].each do |klass|
        klass.set_api_credentials site: 'https://tomvaisar.billapp.cz',
                                  user: 'tomas@vaisar.cz',
                                  password: 'heslo'
      end
    end

    let(:valid_invoice) { Invoice.first }
    let(:invoice_line) { valid_invoice.lines.first }

    describe 'invoice with no expenses' do

      it 'should return expenses of 0' do
        expect(invoice_line.expense_cost(valid_invoice.id)).to eq(0)
      end

      it 'should return earnings equal to total amount' do
        expect(invoice_line.earnings(valid_invoice.id)).to(
          eq(invoice_line.total_amount)
        )
      end

    end

    describe 'invoice with some expenses' do

      before do
        @expense = FactoryGirl.create(:expense,
                                      invoice_id:  valid_invoice.id,
                                      description: invoice_line.description,
                                      expense:     10000)
      end

      it 'should return expenses of 10000' do
        expect(invoice_line.expense_cost(valid_invoice.id)).to(
          eq(10000.0)
        )
      end

      it 'should return earnings 10000 less than total amount' do
        expect(invoice_line.earnings(valid_invoice.id)).to(
          eq(invoice_line.total_amount - 10000.0)
        )
      end

    end

  end

end
