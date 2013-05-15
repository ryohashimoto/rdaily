require 'spec_helper'

describe Post do
  before :each do
    @user = User.create(name: 'ryo', email: 'ryo@example.com', password: 'hogehoge')
  end
  
  it "is valid with a title, body, user_id" do
    post = @user.posts.build
    post.title = 'hoge'
    post.body = 'foobar'
    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post = @user.posts.build
    post.body = 'foobar'
    expect(post).to be_invalid    
  end

  it "is invalid without a body" do
    post = @user.posts.build
    post.title = 'hoge'
    expect(post).to be_invalid    
  end
  it "is invalid without a user_id" do
    post = Post.new(title: 'hoge', body: 'foobar')
    expect(post).to be_invalid
  end
end
