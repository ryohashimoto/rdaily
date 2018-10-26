class AddSlugToPages < ActiveRecord::Migration[4.2]
  def change
    add_column :pages, :slug, :string
  end
end
