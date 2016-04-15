class AddVisitNeededToRealtors < ActiveRecord::Migration
  def change
    add_column :realtors, :visit_needed, :boolean
  end
end
