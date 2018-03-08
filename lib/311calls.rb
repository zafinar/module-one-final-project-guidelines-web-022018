# puts Api.new.map{|i|
# i.select{|key,value| key == :complaint_type && value == "Rodent" }
# }
#

# class IncidentAddress
# @@all = []
# attr_accessor :address
#   def initialize(address)
#     @address = address
#     @@all << self
#   end
#   def self.all
#     @@all
#   end
#
#   def complaint
#     ComplaintAddress.all.select{||}
#   end
#
#
# end
#
#
# class ComplaintAddress
#   @@all = []
#   attr_reader :address, :complaint
#   def initialize(address,complaint)
#     @address = address
#     @complaint = complaint
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
# end
#
#
# class ComplaintType
#   @@all = []
# attr_accessor :complaint
#   def initialize(complaint)
#     @complaint = complaint
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
# end
