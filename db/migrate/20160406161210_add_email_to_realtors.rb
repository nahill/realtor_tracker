class AddEmailToRealtors < ActiveRecord::Migration
  def change
    add_column :realtors, :email, :string
  end
end
