class AddUrlsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :page_url, :string
    add_column :products, :image_url, :string
  end
end
