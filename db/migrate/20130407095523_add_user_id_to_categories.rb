class AddUserIdToCategories < ActiveRecord::Migration[4.2]
  def change
    add_column :categories, :user_id, :integer
  end
end
