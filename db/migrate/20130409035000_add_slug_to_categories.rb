class AddSlugToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :slug, :string, :after => :name
    add_index :categories, :slug

    Category.all.each do |category|
      category.save!
    end      
  end

  def self.down
    remove_index :categories, :slug
    remove_column :categories, :slug
  end
end
