RSpec.feature "Users", type: :feature do
  feature "the signup process" do
    subject(:user) {
      FactoryBot.build(:user)
    }
    scenario "has a new user page" do
      visit new_user_url
      expect(page).to have_content /Reveal Yourself User 🔫/
    end
  
    feature "signing up a user" do
      before(:each) do
        visit new_user_url
        fill_in 'email', :with => user.email
        fill_in 'password', :with => user.password
        click_on "Submit"
      end

      scenario "redirects to Signin Page after signup" do
        expect(page).to have_content /Successfully created your account! Check your inbox for an activation email./
      end
    end
  
    feature "with an invalid user" do

      before(:each) do
        visit new_user_url
        fill_in 'Email', :with => "testing@email.com"
        click_on "Submit"
      end
  
      scenario "re-renders the signup page after failed signup" do
        expect(page).to have_content /Reveal Yourself User 🔫/
      end
    end
  end
end
