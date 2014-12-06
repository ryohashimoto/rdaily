require 'rails_helper'

describe CategoriesController do
  let(:user) { create(:user) }
  let(:category1) do
    category = user.categories.build
    category.name = "ruby"
    category.save!
    category
  end
  let(:post1) do
    post = user.posts.build
    post.title = "Dolorum rerum minus est."
    post.body = "Ratione sapiente deleniti nemo iusto voluptatem "
    post.published_at = Time.now
    categorization = post.categorizations.build
    categorization.category_id = category1.id
    categorization.save!
    post.save!
    post
  end

  describe 'GET #show' do
    before do
      category1
      post1
    end
    
    context "when accessing using category's id" do
      it "popurates an array of posts for a category" do
        get :show, id: category1
        expect(assigns(:posts)).to eq [post1]
      end

      it "renders the :show template" do
        get :show, id: category1
        expect(response).to render_template :show
      end
    end

    context "when accessing using category's slug" do
      it "popurates an array of posts for a category" do
        skip
        get :show, id: category1.slug
        expect(assigns(:posts)).to eq [post1]
      end
      
      it "renders the :show template" do
        get :show, id: category1.slug
        expect(response).to render_template :show
      end
    end
  end
end
