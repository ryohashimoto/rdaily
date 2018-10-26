require 'rails_helper'

describe Post do
  let(:post) do
    create(:post)
  end

  it "is valid with a title, body, user_id" do
    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post.title = nil
    expect(post).to be_invalid
  end

  it "is invalid without a body" do
    post.body = nil
    expect(post).to be_invalid
  end
  it "is invalid without a user_id" do
    post.user_id = nil
    expect(post).to be_invalid
  end
end
