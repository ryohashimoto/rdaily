require 'spec_helper'

describe PostsController do
  let(:user) { create(:user) }
  let(:post1) {
    post = user.posts.build
    post.title = "Dolorum rerum minus est."
    post.body = "Ratione sapiente deleniti nemo iusto voluptatem "
    post.published_at = Time.now
    post.save!
    post
  }

  describe 'GET #index' do
    it "popurates an array of posts published by a user" do
      get :index
      expect(assigns(:posts)).to match_array [post1]
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns the requested post to @post" do
      get :show, id: post1
      expect(assigns(:post)).to eq post1
    end

    it "renders the :show template" do
      get :show, id: post1
      expect(response).to render_template :show
    end
  end

  describe 'GET #feed' do
    it "popurates an array of posts published by a user" do
      get :feed
      expect(assigns(:posts)).to match_array [post1]
    end
  end
end
