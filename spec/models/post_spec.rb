require 'rails_helper'

RSpec.describe Post, type: :model do
    describe 'self.search method' do 
      it "returns user input if database has user input" do 
        user = User.new(first_name: "Sam", last_name: "Smith", email:"sam@smith.com", password: "123555")
        user.save 
        data = Post.new(highlight: 'storj has a new app company')
        data.user_id = User.find_by(first_name: "Sam").id 
        data.save 
        search = Post.search("storj")
        # byebug
          expect(search[0].highlight).to eq(data.highlight)
        end 
      end
    end
  # end 