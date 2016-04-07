class AddBrokerToRealtors < ActiveRecord::Migration
  def change
    add_column :realtors, :broker, :string
  end
end
