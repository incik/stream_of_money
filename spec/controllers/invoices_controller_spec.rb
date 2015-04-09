require 'spec_helper'

describe InvoicesController, :type => :controller do

  describe "Existing invoice" do

    before do
      webmock_invoice_hay
    end

    it 'should load existing invoice' do
      get 'edit', { id: 99941 }
      expect(assigns(:invoice)).to be_truthy
    end
  end

end
