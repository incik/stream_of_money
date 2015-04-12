require 'spec_helper'

describe ExpensesController, :type => :controller do

  describe "Existing adding new expense" do

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @tom = FactoryGirl.create(:tomasvaisarcz)
      sign_in @tom

      webmock_invoice_hay
      [Invoice, InvoiceLine].each do |klass|
        klass.set_api_credentials site: 'https://tomvaisar.billapp.cz',
                                  user: 'tomas@vaisar.cz',
                                  password: 'heslo'
      end
    end

    let(:invoice) { Invoice.find(99941) }
    let(:invoice_line) { invoice.lines.first }

    describe 'adding new expense' do

      it 'should accept valid expense object and save it' do
        post 'create', {
          expense: {
            invoice_id:  invoice.id,
            description: invoice_line.description,
            expense:     1000
          }
        }
        expect(assigns(:expense).id).to be_truthy
      end

      it 'should not accept empty expense object' do
        expect {
          post 'create', {}
        }.to raise_error(ActionController::ParameterMissing)
      end

      it 'should not accept invalid expense object' do
        post 'create', {
          expense: {
            invoice_id: invoice.id,
            expense:    1000
          }
        }
        expect(assigns(:expense).id).to be(nil)
      end

    end

    describe 'modifying existing expense' do

      before do
        @expense = FactoryGirl.create(:expense,
                                      invoice_id: invoice.id,
                                      description: invoice_line.description,
                                      expense: 10000)
      end

      it 'should accept valid expense object and modify it' do
         patch 'update', {
          id: @expense.id,
          expense: {
            invoice_id:  invoice.id,
            description: invoice_line.description,
            expense:     1000
          }
        }
        expect(assigns(:expense).id).to be_truthy
      end

      it 'should not accept empty expense object' do
        expect {
          patch 'update', { id: @expense.id }
        }.to raise_error(ActionController::ParameterMissing)
      end

    end

  end

end
