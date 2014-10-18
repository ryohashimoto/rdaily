require 'rails_helper'

describe User do
  let(:user) do
    build(:user)
  end

  it "is valid with a name, email and password" do
    expect(user).to be_valid
  end
  it "is invalid without a name" do
    user.name = nil
    expect(user).to be_invalid
  end
  it "is invalid without an email" do
    user.email = nil
    expect(user).to be_invalid
  end
  it "is invalid without a password" do
    skip
  end
  it "is invalid with a duplicate email address" do
    expect(user.save!).to be_truthy
    user2 = User.new(name: 'hashimoto', email: user.email, password: 'hogehoge')
    expect(user2).to be_invalid
  end
end
