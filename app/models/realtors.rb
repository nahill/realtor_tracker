class Realtors < ActiveRecord::Base
  validates :office_name, :presence => true
end
