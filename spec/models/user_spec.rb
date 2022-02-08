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
        @user1 = User.new(first_name: "first_name", last_name: "last_name", email: "TEST@TEST.com", password: "pass", password_confirmation: "pass")
        @user1.save
        @user2 = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.COM", password: "pass", password_confirmation: "pass")
        @user2.save

        expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")
      end
    end

    context "the email field is missing" do
      it "will have a error massage: Category can't be blank" do
        @user = User.new(first_name: "first_name", last_name: "last_name", password: "pass", password_confirmation: "pass")
        @user.save
        expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
      end
    end

    context "the first_name field is missing" do
      it "will have a error massage: First name can't be blank" do
        @user = User.new(last_name: "last_name", email: "test@test.com", password: "pass", password_confirmation: "pass")
        @user.save
        expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
      end
    end

    context "the last_name field is missing" do
      it "will have a error massage: Last name can't be blank" do
        @user = User.new(first_name: "first_name", email: "test@test.com", password: "pass", password_confirmation: "pass")
        @user.save
        expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
      end
    end

    context "the password field length is less then 3" do
      it "will have a error massage: Password is too short (minimum is 3 characters)" do
        @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "12", password_confirmation: "12")
        @user.save
        expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 3 characters)")
      end
    end    
  end

  describe '.authenticate_with_credentials' do
    context "user name and password entered are correct" do
      it "will return a user" do
        @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "pass", password_confirmation: "pass")
        @user.save
        testUser = @user.authenticate_with_credentials("test@test.com", "pass")
        expect(testUser).to be_present
      end
    end

    context "email entered has leading and trailling spaces" do
      it "will return a user" do
        @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "pass", password_confirmation: "pass")
        @user.save
        testUser = @user.authenticate_with_credentials("   test@test.com  ", "pass")
        expect(testUser).to be_present
      end
    end

    context "email entered has cased differences " do
      it "will return a user" do
        @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "pass", password_confirmation: "pass")
        @user.save
        testUser = @user.authenticate_with_credentials("TEst@teST.com", "pass")
        expect(testUser).to be_present
      end
    end

    context "email entered is not in dataBase" do
      it "will return nil" do
        @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "pass", password_confirmation: "pass")
        @user.save
        testUser = @user.authenticate_with_credentials("not@here.com", "pass")
        expect(testUser).to eq(nil)
      end
    end

    context "password entered is not correct" do
      it "will return nil" do
        @user = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "pass", password_confirmation: "pass")
        @user.save
        testUser = @user.authenticate_with_credentials("test@test.com", "wrong")
        expect(testUser).to eq(nil)
      end
    end
  end

end
