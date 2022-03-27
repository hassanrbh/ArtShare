require 'rails_helper'

RSpec.describe TracksController, type: :controller do
    describe "GET #new" do
        it "renders the new action in tracks controller" do
            # simulate the http method request first, then passing link: {} as the passing params hash
            get :new, :format => 'html'
            
            expect(response).to render_template('new')
            expect(response).to have_http_status(200)
        end
    end
end
