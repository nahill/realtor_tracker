class CreateRealtors < ActiveRecord::Migration
  def change
    create_table :realtors do |t|
      t.string :office_name
      t.string :office_phone
      t.string :office_address

      t.timestamps
    end
  end
end
