require_relative '../config/environment.rb'
require 'pry'
api = Api.new
address = api.address
complaint = api.complaint

def create_complaint_table(complaint)
  complaint.each {|i| Complaint.create(i)}
end

def create_address_table(address)
  address.each {|i| Address.create(i)}
end

def create_join_table(address,complaint)
  address = create_address_table(address)
  complaint = create_complaint_table(complaint)
  # address.each do |i|
  #
  # end
  #
  #     ComplaintAddress.create(i.id,e.id) if i.id == e.id
  #
  # end
  # i = 0
  # while i  < address.length
  #   ComplaintAddress.create(address[i].id, complaint[i].id)
  #   i += 1
  # end
end

# create_join_table(address,complaint)
create_address_table(address)
create_complaint_table(complaint)

# ct = ComplaintType.create(name: respose_hash.name, etc)
#   ia = IncidentAddress.create(address: response_hash.address, etc)
#   ComplaintAddress.create(complaint_type_id: ct.id, incident_address_id: ia.id)


binding.pry
puts 'lol'
