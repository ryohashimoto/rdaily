require 'spec_helper'

describe Account::PagesController do
  let(:user) { create(:user) }
  let(:page1) {
    page = user.pages.build
    page.title = "Dolorum rerum minus est."
    page.body = "Ratione sapiente deleniti nemo iusto voluptatem "
    page.save!
    page
  }  
  before do
    request.session[:user_id] = user.id
  end

  describe "GET #index" do
    it "popurates an array of pages created by a user" do
      get :index
      expect(assigns(:pages)).to match_array [page1]
    end
    
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end    
  end

  describe "GET #show" do
    it "assigns the requested post to @page" do
      get :show, id: page1
      expect(assigns(:page)).to eq page1
    end
    
    it "renders the :show template" do
      get :show, id: page1
      expect(response).to render_template :show
    end    
  end

  describe "#new" do
  end

  describe "#edit" do
  end

  describe "#create" do
  end

  describe "#update" do
  end

  describe "#destroy" do
  end

  describe "#publish" do
  end

  describe "#unpublish" do
  end
end
