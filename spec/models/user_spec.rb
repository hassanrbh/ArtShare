# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  email            :string           not null
#  session_token    :text             not null
#  password_digest  :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  activated        :boolean          default(FALSE)
#  activation_token :text
#  admin            :boolean          default(FALSE)
#
require 'rails_helper'

RSpec.describe User, type: :model do

  # subject(:user_password) { User.new :email => "test@example.com", :password => "localhost" }
  subject(:user) { FactoryBot.build(:user) }

  describe "validations" do 
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
    it "should raise an error if the password is too short" do
      user = User.new :password => "test"
      user.save
      expect(user.errors[:password]).to eq(["must be at least 6 characters"])
    end
  end
  describe "admins" do 
    it "should return true if the user is admin " do
      admin = FactoryBot.build(:admin)
      expect(admin.admin).to eq true
    end
  end
  describe "associations" do
    it { should have_many :tracks }
  end
  describe "class methods" do 
    describe "#ensure_session_token" do 
      it "should ensure the session token before validations" do 
        user = User.new
        user.save
        expect(user.session_token.length).to be ==
        (User.generate_session_token.length)
      end
      it "should ensure the session token is not added" do 
        user = User.new
        expect(user.session_token).to be nil
      end
    end
    describe "#ensure_activation_token" do 
      it "should ensure the activation token before validations" do
        user = User.new
        user.save
        expect(user.activation_token.length).to be == 16
      end
      it "should ensure the session token is not added" do 
        user = User.new
        expect(user.activation_token).to be nil
      end
    end
    context "#is_password!" do
      it "when the password is right " do 
        password = Faker::Internet.password
        user = FactoryBot.build(:user,password: password)

        expect(user.is_password!(password)).to be true
      end
      it "when the password is wrong " do
        password = Faker::Internet.password
        user = FactoryBot.build(:user,password: password)

        expect(user.is_password!('testing')).to be false
      end 
    end
    context "#reset_session_token!" do
      it "reset the session_token for the current user" do
        user = FactoryBot.build(:user)
        user.valid?
        user_session_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).not_to be user_session_token
      end
    end
    context "#find_by_credentials!" do
      it "should find the user by its credentials" do
        user = FactoryBot.create(:user)
        expect(User.find_by_credentials!(user.email,user.password)).to be_truthy
      end
      it "shoudl return nil if the user does not exist" do
        expect(User.find_by_credentials!("test@test.com","password")).to be_nil
      end
    end
  end
end
