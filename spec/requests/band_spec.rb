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
  describe "GET #show" do 
    it "should renders the show template" do
      get "/bands/2"
        expect(response.status).to eq(302)
        expect(response).to redirect_to "/signin"
      end
      context "if the band is not found" do
        it "it not success" do 
          get "/bands/1"
          expect(response).to redirect_to "/bands"
          expect(response.status).to eq(302)
      end
    end
  end
  describe "POST #create" do 
    context "with invalid params" do
      it "redirect to the new band path page"
    end
    context "whih valid params" do
      it "redirect to the band path of that band created" 
    end
  end
end
