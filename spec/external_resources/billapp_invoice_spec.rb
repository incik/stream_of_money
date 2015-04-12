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

      describe 'invoice with no expsenses' do
        it 'should return 0 for expenses' do
          expect(valid_invoice.expenses_cost).to be_equal(0)
        end

        it 'should say that earnings are same as total amount' do
          expect(valid_invoice.earnings.to_f).to(
            be_equal(valid_invoice.total_amount.to_f)
          )
        end
      end

      describe 'invoice with some expsenses' do

        let(:invoice_line) { valid_invoice.lines.first }

        before do
          @expense = FactoryGirl.create(:expense,
                                        invoice_id:  valid_invoice.id,
                                        description: invoice_line.description,
                                        expense:     10000)
        end

        it 'should return expenses of 10000' do
          expect(valid_invoice.expenses_cost.to_f).to be_equal(10000.0)
        end

        it 'should return earnings 10000 less than total amount' do
          expect(valid_invoice.earnings.to_f).to(
            be_equal((valid_invoice.total_amount - 10000).to_f)
          )
        end

      end
    end

  end

end
