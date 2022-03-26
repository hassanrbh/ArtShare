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
    scenario "with valid login credentials" do
      login_user!("hassantarif4@gmail.com","lvsaze12A@")
      expect(current_path).to eq("/bands")
      expect(page).to have_content("Welcome Again hassantarif4@gmail.com")
    end
  end
end
