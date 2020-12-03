require 'rails_helper'

RSpec.describe RequestsController, type: :request do
  describe "GET #index" do
    context "as a non_admin user" do
      user = FactoryBot.create(:user)
      it "redirects to root_path" do
        sign_in user
        get requests_path
        expect(response).to redirect_to root_path
      end
    end

    context "as an admin user" do
      admin = FactoryBot.create(:user, admin: true)
      it "renders the requests index" do
        sign_in admin
        get requests_path
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end

    context "as a non-authenticated user" do
      it "redirects to new_user_session_path" do
        get requests_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "Post #create" do
    context "with invalid params" do
      it "doesn't save the instance" do
        post "/requests", params: { request: { name: "Tintol" } }
        expect { response }.to_not change(Request, :count)
      end
    end

    context "with valid params" do
      it "redirects to root_path on success" do
        post "/requests", params: { request: { name: "Tintol", description: "teste", variant: "Tinto", country: "Portugal", region: "Alentejo", volume: "10" } }
        expect(Request.count).to eq(1)
        expect(response).to redirect_to root_path
      end
    end
  end
end
