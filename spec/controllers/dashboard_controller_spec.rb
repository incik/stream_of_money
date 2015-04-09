require 'spec_helper'

describe DashboardController, :type => :controller do

  describe "Unsigned user tries to access invoices overview" do

    it "should redirect to login form" do
      get 'index', {}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "Signed user with no invoices" do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @karel = FactoryGirl.create(:karelbagrcz)
      sign_in @karel
    end

    it "should show no invoices" do
      get 'index', {}
      expect(assigns(:invoices).count).to equal(0)
    end

  end

  describe "Signed user with some invoices" do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @tom = FactoryGirl.create(:tomasvaisarcz)
      sign_in @tom
    end

    it "should load at least one invoice" do
      get 'index', {}
      expect(assigns(:invoices).count).to be >= 1
    end
  end

end