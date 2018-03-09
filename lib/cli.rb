require 'pry'
class Cli
def initialize
call
end

def call
  welcome
  input_check
end


def welcome
  puts "Welcome to the NYC 311 call search."
  puts "Type 'Address' to search by address."
  puts "Type 'Incident' to search by incident type."
end

def input
  gets.chomp
end

def input_check
  i = input.downcase
  if i == "address"
    puts "Enter the address."
    puts  Address.find_by(incident_address: input).complaint.map{|i| i.complaint_type}

  elsif i == "incident"
    puts "Enter the complaint type."
    puts Complaint.find_by(complaint_type: input).address.map{|i| i.incident_address}
    binding.pry
  else
  puts "I'm sorry I don't recognize that command."
  call
  end
end

end
# Cli.new
# binding.pry
# puts "lol"
