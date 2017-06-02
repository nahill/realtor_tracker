require 'csv'
namespace :import do
  task realtorss: :environment do
    filename = File.join Rails.root, "REALTORLIST.csv"
    CSV.foreach(filename) do |row|
      office_name, office_phone, notes = row
      current_rltr = Realtors.new(office_name: office_name.upcase, office_phone: office_phone, notes: notes, last_visited: '2017-03-03')
      rltr_name = current_rltr.office_name
      if rltr_name.blank?
        puts "Sorry but #{office_phone} could not be added to the database"
      else
        current_rltr.save
        puts "Currently adding #{office_phone} to the database"
      end
  end
 end
end