require "rails_helper"

describe User do
  context "test" do
    it "should have a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end

  context "validation" do
    describe "username" do
      it "should be present" do
        expect(FactoryGirl.build(:user, username: nil)).to be_invalid
      end

      it "should not exceed 15 characters" do
        expect(FactoryGirl.build(:user, username: "a" * 16)).to be_invalid
      end
    end

    describe "email" do
      it "should be present" do
        expect(FactoryGirl.build(:user, email: nil)).to be_invalid
      end

      it "should be properly formatted" do
        invalid_addresses = %w(a .com @.com a@.com)
        invalid_addresses.each do |address| 
          user = FactoryGirl.build(:user, email: address)
          expect(user).to be_invalid 
        end
        expect(FactoryGirl.build(:user, email: "a@b.com")).to be_valid
      end

      it "should be unique" do
        FactoryGirl.create(:user, email: "a@b.com")
        expect(FactoryGirl.build(:user, email: "A@B.com")).to be_invalid
      end

      it "should not exceed 255 characters" do
        valid_email = "a" * 249 + "@b.com"
        expect(FactoryGirl.build(:user, email: valid_email)).to be_valid
        invalid_email = "a" + valid_email
        expect(FactoryGirl.build(:user, email: invalid_email)).to be_invalid
      end

      it "should be saved as lower-case" do
        mixed_case_email = "Foo@ExAMPle.CoM"
        user = FactoryGirl.create(:user, email: mixed_case_email)
        expect(user.email).to eq(mixed_case_email.downcase)
      end
    end

    describe "password" do
      it "should be present (nonblank)" do
        blank_password = " " * 6
        expect(FactoryGirl.build(:user, password: blank_password, password_confirmation: blank_password)).to be_invalid
      end

      it "should have a minimum length" do
        invalid_password = "a" * 5
        expect(FactoryGirl.build(:user, password: invalid_password, password_confirmation: invalid_password)).to be_invalid
      end
    end
  end
end
