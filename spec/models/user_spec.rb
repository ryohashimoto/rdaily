require 'spec_helper'

describe User do
  it "is valid with a name, email and password" do
    user = User.new(name: 'ryo', email: 'ryo@example.com', password: 'hogehoge')
    expect(user).to be_valid
  end
  it "is invalid without a name" do
    user = User.new(email: 'ryo@example.com', password: 'hogehoge')
    expect(user).to be_invalid
  end
  it "is invalid without an email" do
    user = User.new(name: 'ryo', password: 'hogehoge')
    expect(user).to be_invalid    
  end
  it "is invalid without a password" do
    user = User.new(name: 'ryo', email: 'ryo@example.com')
    expect(user).to be_invalid
  end
  it "is invalid with a duplicate email address" do
    user1 = User.new(name: 'ryo', email: 'ryo@example.com', password: 'hogehoge')
    expect(user1.save!).to be_true
    user2 = User.new(name: 'hashimoto', email: 'ryo@example.com', password: 'hogehoge')
    expect(user2).to be_invalid
  end
end
