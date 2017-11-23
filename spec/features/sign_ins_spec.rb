require 'rails_helper'

RSpec.feature "SignIn ", type: :feature do
  before (:each) do 
    User.create(email: "sophie@yang.com", first_name: "Sophie", last_name: "Yang", password:"1234567")
   end 

   it "sign me in" do 
    visit '/session/new'
    within("#session") do 
      fill_in 'email', with: 'sophie@yang.com'
      fill_in 'password', with: '1234567'
      click_button('log in')
      expect(page.body).to have_content('Sign out')
      end 

    end 
   
end
