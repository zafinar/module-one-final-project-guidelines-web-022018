require 'rest-client'
require 'JSON'
require 'pry'
#defines API class which parses through JSON giving an ARRAY with embedded hashes of 311 calls.
class Api
    attr_reader :call
      def initialize
        @call = JSON.parse(RestClient.get("https://data.cityofnewyork.us/resource/fhrw-4uyv.json"))

      end

      def join
        @call.map do |i|
          join ={
            incident_address: i["incident_address"],
            incident_zip: i["incident_zip"],
            cross_street_1: i["cross_street_1"],
            cross_street_2: i["cross_street_2"],
            borough: i["borough"],
            city: i["city"],
            location_type: i["location_type"],
            address_type: i["address_type"],
            street_name: i["street_name"],
            complaint_type: i["complaint_type"],
            descriptor: i["descriptor"]
            }

        end
      end
        #join table needs to be 3 way, descriptor needs to be independent class.
      def create_join_table
        join.each do |i|
          c = Complaint.find_or_create_by(complaint_type: i[:complaint_type])
          a = Address.find_or_create_by(incident_address:  i[:incident_address])
          # c = Descriptor.create(i.except(:incident_address,:incident_zip,:cross_street_1,:cross_street_2,:borough,:city,:location_type,:address_type,:street_name))
          ComplaintAddress.find_or_create_by(address_id: a.id, complaint_id: c.id, descriptor: i[:descriptor])


        end

      end




end
