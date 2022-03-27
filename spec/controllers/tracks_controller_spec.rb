require 'rails_helper'

RSpec.describe TracksController, type: :controller do
    describe "GET #new" do
        # simulate the http method request first, then passing link: {} as the passing params hash
        get :new, link: {}

        expect(response).to render_template('new')
        expect(response).to have_http_status(200)
    end
end
