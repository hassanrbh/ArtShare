require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET #index" do
    it "should renders all the users just for the admins" do
      get users_path
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end
  describe "GET #show" do 
    it "should renders the show template"
    context "if the user is not exist" do
      it "it not success"
    end
  end
  describe "POST #create" do 
    context "with invalid params" do
      it "renders the new form"
    end
    context "whih valid params" do
      it "redirect to the login page for confirmation email" 
    end
  end
end


# status code
# if something is working we redirect to what
# if something is not working we redirect to what