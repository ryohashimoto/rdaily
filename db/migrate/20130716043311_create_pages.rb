class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :sequence
      t.integer :user_id
      t.datetime :published_at

      t.timestamps      
    end
    
    add_index :pages, :id, :unique => true
    add_index :pages, :published_at    
  end
end
