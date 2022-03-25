require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do 
    it { should validate_presence_of(:activation_token) }
    it "should validates the presence and the uniqueness of email " do 
      user = User.new :password => "password"
      expect(user.valid?).to eq false
    end
    it "should validates the presence of session_token" do 
      user = User.new :email => "heyyougotit"
      expect(user.valid?).to eq false
    end
    it "should valudates the uniqueness of session_token" do 
      user_1 = User.new
      user_2 = User.new
      expect(user_1.session_token !=  user_2.session_token).to eq true
    end
    it "should validates the presence of password digest" do 
      user_1 = User.new :password => "password"
      expect(user_1.password_digest.present?).to eq true
    end
    it "should validates the uniqueness of password digest" do
      user_1 = User.new :password => "password1"
      user_2 = User.new :password => "password2"
      expect(user_1.password_digest == user_2.password_digest).to eq false
    end
    it "should validates the length of the password minimum > 6" do 
      user_1 = User.new :password => "lvsaze12A@"
      expect(user_1.password.length).to be > 6 
    end
  end
  describe "associations" do
    it { should have_many :tracks }
  end
  describe "class methods" do 
    describe "#ensure_session_token" do 
      it "should ensure the session token after initialize"
    end
    describe "#ensure_activation_token" do 
      it "should ensure the activation token after initialize"
    end
  end
end
