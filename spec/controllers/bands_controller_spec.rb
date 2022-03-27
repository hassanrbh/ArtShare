require 'rails_helper'

RSpec.describe BandsController, type: :controller do
    describe "GET #new" do
        it "renders the new template" do
            get :new, params: {}
            expect(response).to render_template("new")
            expect(response).to have_http_status(200)
        end
    end
end
