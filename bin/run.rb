require_relative '../config/environment.rb'
require 'pry'
api = Api.new
# address = api.address
# complaint = api.complaint
join = api.join

# def create_complaint_table(complaint)
#   complaint.each {|i| Complaint.create(i)}
# end
#
# def create_address_table(address)
#   address.each {|i| Address.create(i)}
# end
#try debugging this BITCHES
def create_join_table(join)
  join.each do |i|
    c = Complaint.create(i.except(:incident_address,:incident_zip,:cross_street_1,:cross_street_2,:borough,:city,:location_type,:address_type,:street_name)).find_or_create_by(:complaint_type, i[:complaint_type])
    a = Address.create(i.except(:complaint_type,:descriptor)).find_or_create_by(:incident_address, i[:incident_address])
    # ComplaintAddress.create(address_id: a.id, complaint_id: c.id)

binding.pry
  end

end

# def create_join_table
#   idx = 0
#   while idx < Complaint.all.length
#     ComplaintAddress.create({address_id: Address.all[idx].id, complaint_id: Complaint.all[idx].id})
#       idx +=1
#   end
# end

# create_join_table(address,complaint)
# create_address_table(address)
# create_complaint_table(complaint)
create_join_table(join)

# ct = ComplaintType.create(name: respose_hash.name, etc)
#   ia = IncidentAddress.create(address: response_hash.address, etc)
#   ComplaintAddress.create(complaint_type_id: ct.id, incident_address_id: ia.id)


# binding.pry
puts 'lol'
