require "rails_helper"

RSpec.describe WelcomeController, type: :controller do
  context "When not logged in" do
    describe "GET index" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  context "When logged in" do
    before :each do
      sign_in FactoryGirl.create(:teacher)
    end

    describe "GET index" do
      it "redirects to login page" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end
end