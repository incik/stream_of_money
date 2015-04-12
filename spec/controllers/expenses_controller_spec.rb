require 'spec_helper'

describe ExpensesController, :type => :controller do

  describe "Existing adding new expense" do

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @tom = FactoryGirl.create(:tomasvaisarcz)
      sign_in @tom

      webmock_invoice_hay
    end

    let(:invoice) { Invoice.find(99941) }
    let(:invoice_line) { invoice.lines.first }

    describe 'adding new expense' do

      it 'should accept valid expense object and save it'

      it 'should not accept invalid expense object'

    end

    describe 'modifying existing expense' do

      it 'should accept valid expense object and modify it'

      it 'should not accept invalid expense object'

    end

  end

end
