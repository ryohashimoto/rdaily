class DisableHstore < ActiveRecord::Migration
  def up
    execute("drop extension hstore")
  end
end
