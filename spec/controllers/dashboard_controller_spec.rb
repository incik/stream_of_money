require 'spec_helper'

describe DashboardController, :type => :controller do

  describe "access invoices overview" do

    it "should redirect to login form if user is not signed in" do
      get 'index', {}
      expect(response).to redirect_to(new_user_session_path)
    end

    it "should load dashboard if user is signed in" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @incik = FactoryGirl.create(:minimal_user)
      sign_in @incik

      get 'index', {}
      expect(response).to have_selector('.invoice-list')
    end
  end

end