class ChangeRealtorsLastVisited < ActiveRecord::Migration
  def change
    change_table :realtors do |t|
      t.change :last_visited, :date
    end
  end
end
