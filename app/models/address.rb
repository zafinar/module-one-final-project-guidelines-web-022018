require "pry"
require 'active_record'
class Address < ActiveRecord::Base

  has_many :complaint_address
  has_many :complaint, through: :complaint_address
  # binding.pry
end
