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

      it 'should return empty array for expenses'

    end

    describe 'invoice with some expenses' do

      it 'should return expenses of 10000'

    end

  end

end
