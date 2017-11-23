require 'rails_helper'
# require 'spec_helper'

RSpec.describe User, type: :model do
    describe 'user name validation' do 
      it "returns false if first name is not present " do 
          user  = User.new(first_name: nil, last_name: 'Yang', email: "sophie@yang.com", password: "123555") 
          user.save 
          expect(user.valid?).to eq(false)
        end 
      it "returns false if last name is not present " do 
        user  = User.new(first_name: 'Sophie', last_name: nil, email: "sophie@yang.com", password: "123555") 
        user.save 
        expect(user.valid?).to eq(false)
      end 

       it "returns true if last and first name are present " do 
        user  = User.new(first_name: 'Sophie', last_name: 'Yang', email: "sophie@yang.com", password: "123555") 
        user.save 
        expect(user.save).to eq(true)
      end 

    end

    describe 'user email validation' do 
         it "returns false if email is not unique " do 
          user1  = User.new(first_name: 'Sophie', last_name: 'Yang', email: "sophie@yang.com", password: "123555") 
          user1.save 
          user2  = User.new(first_name: 'Sam', last_name: 'Smith', email: "sophie@yang.com", password: "123555") 
          expect(user2.save).to eq(false)
        end 

         it "returns true if email is unique " do 
          user1  = User.new(first_name: 'Sophie', last_name: 'Yang', email: "sophie@yang.com", password: "123555") 
          user1.save 
          user2  = User.new(first_name: 'Sam', last_name: 'Smith', email: "sam@smith.com", password: "123555") 
          expect(user2.save).to eq(true)
        end 
    end 
end
  # rspec spec/models/user_spec.rb --format documentation