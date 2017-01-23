require 'rails_helper'

RSpec.describe User, type: :model do

  # validations
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  # associations
  it { should have_many(:subs) }
  it { should have_many(:comments) }
  # it { should have_many(:user_votes) }
  ## we didn't get to build this feature yet :)

  subject(:user) { user = User.create(username: "username123", password: "secret_password") }

  describe '#is_password?' do

    it "returns true for the correct password" do
      expect(user.is_password?("secret_password")).to be true
    end

    it "returns false for an incorrect password" do
      expect(user.is_password?("not_password")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "should give the user a different token" do
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(old_token)
    end

    it "should update user's token in the database" do
      old_token = user.session_token
      new_token = user.reset_session_token!
      expect(user.session_token).not_to eq(old_token)
      expect(User.find_by(session_token: old_token)).to be nil
      expect(User.find_by(session_token: new_token)).to eq(user)
    end
  end

  describe "::find_by_credentials" do
    it "should find a user by username and password" do
      user.save
      expect(User::find_by_credentials("username123", "secret_password")).to eq(user)
    end

    it "should return nil if the username is incorrect" do
      user.save
      expect(User::find_by_credentials("", "secret_password")).to be nil
    end

    it "should return nil if the password is incorrect" do
      user.save
      expect(User::find_by_credentials("username123", "")).to be nil
    end
  end

end
