require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/accounts/login"
      expect(response).to have_http_status(:success)
    end
  end

end
