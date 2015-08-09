class Realtors < ActiveRecord::Base
  validates :office_name, :presence => true
  
  searchkick
end

