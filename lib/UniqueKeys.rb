require 'rest-client'
require 'JSON'

api = JSON.parse(RestClient.get("https://data.cityofnewyork.us/resource/fhrw-4uyv.json"))

def unique_key(api)
  api_array = api.map{|i|
    i.map{|key,value| key}}.flatten
  api_array.uniq!

  # }[0].uniq
  # api.select {|i| i.}
  # puts api.length
end


puts unique_key(api)
