class DeleteProducts < ActiveRecord::Migration
  def up
    drop_table :products
  end
end
