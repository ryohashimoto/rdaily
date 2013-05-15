require 'spec_helper'

describe Account::PostsController do
  let(:user) { create(:user) }
  
  before do
    request.session[:user] = user.id
  end
  
  describe 'GET #index' do
    it "popurates an array of posts created by a user" do
      post = create(:post)
      get :index
      expect(assigns(:post)).to match_array [post]
    end
    
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :show, id: post
      expect(assigns(:post)).to eq post
    end
    
    it "renders the :show template" do
      post = create(:post)
      get :show, id: post
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Post to @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :edit, id: post
    end
    it "renders the :edit template"
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new post in the database"
      it "redirect to the home page"
    end

    context "with invalid attributes" do
      it "does not save the new post in the database"
      it "re-renders the :new template"
    end
  end

  describe 'PUT #update' do
    context "with valid attributes" do
      it "updates the post in the database"
      it "redirects to the post"
    end
    context "with invalid attributes" do
      it "does not update the post"
      it "re-renders the #edit template"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the post from the database"
    it "redirects to the home page"
  end
end
