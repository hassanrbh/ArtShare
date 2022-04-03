require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject(:user) {
    FactoryBot.create(:user)
  }
    describe "GET #new" do
      it "renders the new template" do
        get :new, params: {}
        expect(response).to render_template("new")
        expect(response).to have_http_status(200)
      end
    end
    describe "POST #create" do
      context "with invalid params" do
        it "validates the presence of the user's email and password" do
          post :create, params: {users: { :email => user.email,:password => "" }}
          expect(response).to redirect_to new_user_path
          expect(flash[:errors]).to be_present
        end
        it "validates that the password is at least 6 characters long" do
          post :create, params: {users: { :email => user.email,:password => "lvs"}}
          expect(response).to redirect_to new_user_path
          expect(flash[:errors]).to be_present
        end
      end
      context "with valid params" do
        it "redirects user to sign in page on success" do
          user_i = FactoryBot.build(:user, :activated => true)
          post :create, params: { users: 
            {
              email: user.email,
              password: user.password,
              session_token: user.session_token,
              activation_token: user.activation_token
            }
          }
          expect(response).to have_http_status(302)
          expect(response).to redirect_to("/users/new")
        end
      end
    end
end
