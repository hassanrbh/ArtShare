require 'rails_helper'

RSpec.describe "Bands", type: :request do
  describe "GET #index" do
    it "should renders all the bands" do
    get "/bands"
      # it check if the status code is 302 redirect
      expect(response.status).to eq(302)
      # it redirect to the signin page if the user is not authenticated
      expect(response).to redirect_to "/signin"
    end
  end
end
