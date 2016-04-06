class AddNotesToRealtors < ActiveRecord::Migration
  def change
    add_column :realtors, :notes, :string
  end
end
