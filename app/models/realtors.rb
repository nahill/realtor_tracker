class Realtors < ActiveRecord::Base
  validates :office_name, :presence => true
  
  scope :realtor_search, -> (office_name) { where("office_name like ?", "#{office_name}%")}
end

