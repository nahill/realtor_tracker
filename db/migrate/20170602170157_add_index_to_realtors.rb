class AddIndexToRealtors < ActiveRecord::Migration
  def change
    add_index :realtors, :office_name
  end
end
