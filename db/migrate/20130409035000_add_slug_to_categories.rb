class AddSlugToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :slug, :string, :after => :name
    add_index :categories, :slug

    Category.find_each(&:save)
  end

  def self.down
    remove_index :categories, :slug
    remove_column :categories, :slug
  end
end
