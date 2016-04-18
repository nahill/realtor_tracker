class Realtors < ActiveRecord::Base
  validates :office_name, :presence => true
  validates :last_visited, :presence => true
  
  scope :realtor_search, -> (office_name) { where("office_name like ?", "#{office_name}%").reorder(:office_name)}

  
  def go_visit?
    if last_visited == nil 
       return true
      else if last_visited <= 14.day.ago
        return true
      else
        return false
      end
    end
  end

  
  
  def self.dedupe
    #find all models and group them on keys which should be common
    grouped = all.group_by{|model| [model.office_name]}
    grouped.values.each do |duplicates|
    #first_one = duplicates.shift
      
      duplicates.each{|double| double.destroy}
    end
  end
  
  def self.nameclean
    rltr = all.group_by{|model| [model.office_name]}
    rltr.each do |nils|
       if nils.blank?
         nils.destory
       else
       end
    end
  end
  
end

