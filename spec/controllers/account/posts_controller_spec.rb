require 'spec_helper'

describe Account::PostsController do
  describe 'GET #index' do
    it "popurates an array of posts created by a user"
    it "renders the :index view"
  end

  describe 'GET #show' do
    it "assigns the requested post to @post"
    it "renders the :show template"
  end

  describe 'GET #new' do
    it "assigns a new Post to @post"
    it "renders the :new template"
  end

  describe 'GET #edit' do
    it "assigns the requested post to @post"
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
