require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context "a user with all fields given" do
      it "will save" do
        @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "pass", password_confirmation: "pass")
        @user.save
        expect(@user.id).to be_present
      end
    end

    context "a user with all fields given but not matching passwords" do
      it "will have error message: Password confirmation doesn't match Password" do
        @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "pass", password_confirmation: "Pass")
        @user.save
        expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
      end
    end

    context "a user with not unique email" do
      it "will save" do
        @user1 = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "pass", password_confirmation: "pass")
        @user1.save
        @user2 = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "pass", password_confirmation: "pass")
        @user2.save

        expect(@user2.errors.full_messages).to eq("")
      end
    end

    
  end
end
