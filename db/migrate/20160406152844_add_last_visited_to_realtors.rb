class AddLastVisitedToRealtors < ActiveRecord::Migration
  def change
    add_column :realtors, :last_visited, :string
  end
end
