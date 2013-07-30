class CreateProducts < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute("create extension if not exists hstore")
      end
      dir.down do
        execute("drop extension hstore")
      end 
    end
    create_table :products do |t|
      t.string :asin
      t.string :title
      t.hstore :data

      t.timestamps
    end
  end
end
