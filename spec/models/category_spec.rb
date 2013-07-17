require 'spec_helper'

describe Category do
  before do
    @user = User.create(name: 'ryo', email: 'ryo@example.com', password: 'hogehoge', password_confirmation: 'hogehoge')
  end
  
  it "is valid with a name" do
    category = @user.categories.build
    category.name = 'rails'
    expect(category.slug).to be_nil
    expect(category).to be_valid
    expect(category.slug).not_to be_nil
  end

  it "is successfully saved with a name and a slug is generated." do
    category = @user.categories.build
    category.name = 'rails'
    category.save!
    expect(category.slug).not_to be_nil
  end

  it "is invalid without a name" do
    category = @user.categories.build
    expect(category).to be_invalid 
  end
end
