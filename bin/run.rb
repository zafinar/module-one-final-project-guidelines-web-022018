require_relative '../config/environment.rb'
require 'pry'
api = Api.new
api.call_api

binding.pry
puts 'lol'
