require 'csv'
namespace :import do
  task realtorss: :environment do
    filename = File.join Rails.root, "REALTORLIST.csv"
    CSV.foreach(filename) do |row|
      office_name, office_phone = row
      Realtors.create(office_name: office_name, office_phone: office_phone)
  end
 end
end