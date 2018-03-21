require 'rails_helper'

describe User do

  subject(:user) do
    FactoryBot.build(:user,
      email: "fake@fake.com",
      password: "password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do

    context "is password" do
      it "verifies password" do
        expect(user.is_password?("password")).to be true
      end
    end

    context "is not password" do
      it "verifies password" do
        expect(user.is_password?("not password")).to be false
      end
    end

  end

  describe "::find_by_credentials" do

    before(:each) do
      user.save
    end

    it "returns user given good credentials" do
      expect(User.find_by_credentials("fake@fake.com", "password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("fake@fake.com", "not password")).to eq(nil)
    end

  end

end
