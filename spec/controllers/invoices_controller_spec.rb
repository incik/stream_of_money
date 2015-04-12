require 'spec_helper'

describe InvoicesController, :type => :controller do

  describe "Existing invoice" do

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @tom = FactoryGirl.create(:tomasvaisarcz)
      sign_in @tom

      webmock_invoice_hay
    end

    it 'should load existing invoice' do
      get 'edit', { id: 99941 }
      expect(assigns(:invoice)).to be_truthy
    end
  end

end
