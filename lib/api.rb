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

      def call_api

        @call.each do |i|
          hash = {
            complaint_type: i["complaint_type"]
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
