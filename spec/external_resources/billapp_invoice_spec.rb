require 'spec_helper'

describe 'invoice resource' do

  describe 'user has no invoices' do

    before do
      webmock_no_invoices
      Invoice.set_api_credentials site: 'https://karelbagr.billapp.cz',
                                  user: 'karel@bagr.cz',
                                  password: 'heslo'
    end

    it "shouldn't load any invoices" do
      expect(Invoice.all.count).to be_equal(0)
    end

  end

  describe 'user has at least one invoice' do

    before do
      webmock_1_invoice
      [Invoice, InvoiceLine].each do |klass|
        klass.set_api_credentials site: 'https://tomvaisar.billapp.cz',
                                  user: 'tomas@vaisar.cz',
                                  password: 'heslo'
      end
    end

    it 'should load at least one invoice' do
      expect(Invoice.all.count).to be >= 1
    end

    describe 'Valide invoice' do

      let(:valid_invoice) { Invoice.first }

      it 'should have at least one line' do
        expect(valid_invoice.lines.count).to be >= 1
      end
    end

  end

end
