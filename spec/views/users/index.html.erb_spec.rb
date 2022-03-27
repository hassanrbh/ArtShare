require 'rails_helper'

RSpec.describe "users/index" do 
    let(:admin) { User.create :email => "example.com",
        :password => "secretpass",
        :admin => true
    } 
    it "renders all the users" do
        # assigning users variable to play with it
        assign(:users, [
            User.create!(:email => "test@test",:password => "hassantarif"),
            User.create!(:email => "test@testhassan",:password => "hassantarif"),
        ])      
        # render the template
        render 
        # set expectations
        expect(rendered).to match(/test@test/)
        expect(rendered).to match(/test@testhassan/)
    end
    it "checks the Admin panel logo is there" do 
        assign(:users, [
            User.create!(:email => "test@test", :password => "lvsaze12A@"),
        ])
        render
        expect(rendered).to match(/Admin Panel/)
    end
end