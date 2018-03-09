require 'rest-client'
require 'JSON'
require 'pry'
#defines API class which parses through JSON giving an ARRAY with embedded hashes of 311 calls.
class Api
    attr_reader :call
      def initialize
        @call = JSON.parse(RestClient.get("https://data.cityofnewyork.us/resource/fhrw-4uyv.json"))
        # binding.pry
      end

      # def complaint
        # complaint = {complaint_type: "",descriptor: ""}
        # @call.map do |i|
          # if i.key?("incident_address")
            # complaint = {
            # complaint_type: i["complaint_type"],
            # descriptor: i["descriptor"]
          # }
      #     end
      #   end
      # end
      #
      # def address
      #   @call.map do |i|
          # address = {
          #    incident_address: i["incident_address"],
          #    incident_zip: i["incident_zip"],
          #    cross_street_1: i["cross_street_1"],
          #    cross_street_2: i["cross_street_2"],
          #    borough: i["borough"],
          #    city: i["city"],
          #    location_type: i["location_type"],
          #    address_type: i["address_type"],
          #    street_name: i["street_name"]
          #
          #   }
      #     end
      # end
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
end
# api = Api.new.call

  # def unique_key(api)
  #   api_array = api.map{|i|
  #     i.map{|key,value| key}}.flatten
  #   api_array.uniq!
  # end





# puts unique_key(api)
