class Realtors < ActiveRecord::Base
  validates :office_name, :presence => true
  
  searchable do
    text :office_name
  end
end

