require_relative '../config/environment.rb'
require 'pry'
api = Api.new
api.create_join_table
Cli.new

# rake db:drop
# rake db:migrate

# address = api.address
# complaint = api.complaint


# def create_complaint_table(complaint)
#   complaint.each {|i| Complaint.create(i)}
# end
#
# def create_address_table(address)
#   address.each {|i| Address.create(i)}
# end
#try debugging this BITCHES


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

# ct = ComplaintType.create(name: respose_hash.name, etc)
#   ia = IncidentAddress.create(address: response_hash.address, etc)
#   ComplaintAddress.create(complaint_type_id: ct.id, incident_address_id: ia.id)


# binding.pry

puts 'lol'
