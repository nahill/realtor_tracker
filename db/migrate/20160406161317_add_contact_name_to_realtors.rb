class AddContactNameToRealtors < ActiveRecord::Migration
  def change
    add_column :realtors, :contact_name, :string
  end
end
