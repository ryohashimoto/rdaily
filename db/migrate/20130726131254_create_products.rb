class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :asin
      t.string :title
      t.hstore :data

      t.timestamps
    end
  end
end
