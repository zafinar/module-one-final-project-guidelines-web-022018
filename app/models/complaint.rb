require 'active_record'
class Complaint < ActiveRecord::Base
  has_many :complaint_address
  has_many :address, through: :complaint_address
end
