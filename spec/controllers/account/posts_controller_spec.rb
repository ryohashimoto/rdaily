require 'spec_helper'

describe Account::PostsController do
  let(:user) { create(:user) }
  let(:post1) {
    post = user.posts.build
    post.title = "Dolorum rerum minus est."
    post.body = "Ratione sapiente deleniti nemo iusto voluptatem "
    post.save!
    post
  }  
  before do
    request.session[:user_id] = user.id
  end
  
  describe 'GET #index' do
    it "popurates an array of posts created by a user" do
      get :index
      expect(assigns(:posts)).to match_array [post1]
    end
    
    it "renders the :index view" do
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
      get :edit, id: post1
      expect(assigns(:post)).to eq post1
    end
    it "renders the :edit template" do
      get :edit, id: post1
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new post in the database" do
        expect {
          post :create, post: {title: "hoge1", body: "foobar1"}
        }.to change(Post, :count).by(1)
      end
      it "redirect to the home page" do
        post :create, post: {title: "hoge2", body: "foobar2"}
        expect(response).to redirect_to account_path
      end
    end

    context "with valid attributes (and categories)"

    context "with invalid attributes" do
      it "does not save the new post in the database" do
        expect {
          post :create, post: {body: "foobar1"}
        }.to_not change(Post, :count)
      end
      it "re-renders the :new template" do
        post :create, post: {body: "foobar1"}
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @post = post1
    end
    
    context "with valid attributes" do
      it "updates the post in the database" do
        put :update, id: @post, post: attributes_for(:post, title: "fuga3")
        @post.reload
        expect(@post.title).to eq("fuga3")
      end
      it "redirects to the updated post" do
        put :update, id: @post, post: attributes_for(:post, title: "fuga3")
        expect(response).to redirect_to account_path
      end
    end
    context "with invalid attributes" do
      it "does not update the post" do
        put :update, id: @post, post: attributes_for(:post, title: "")
        @post.reload
        expect(@post.title).to_not eq("")
      end
      it "re-renders the #edit template" do
        put :update, id: @post, post: attributes_for(:post, title: "")
        expect(response).to redirect_to account_path
      end
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the post from the database"
    it "redirects to the home page"
  end
end
