require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET #new" do
        it "renders the new template" do
          get :new, params: {}
          expect(response).to render_template("new")
          expect(response).to have_http_status(200)
        end
    end
    describe "GET #index" do
        it "renders the index" do
          get :index, params: {users: {}}
          expect(response).to have_http_status(200)
          expect(response).to render_template("index")
        end
    end
end
