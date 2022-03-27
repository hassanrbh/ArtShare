require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe "login form" do
    before(:each) do
      visit "/signin"
    end
    
    scenario "with invalid password" do
      login_user!("fake@fakemail.com","fakemail")
      expect(current_path).to eq("/signin")
      expect(page).to have_content("credentials failed, Try Again ! 🔫 🚓")
    end
  end
end
