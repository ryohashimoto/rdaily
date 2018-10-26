class CreateCategorizations < ActiveRecord::Migration[4.2]
  def change
    create_table :categorizations do |t|
      t.integer :post_id, :category_id
      t.timestamps
    end

    add_index :categorizations, :post_id
    add_index :categorizations, :category_id
  end
end
