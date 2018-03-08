class Cli

def initialize
  welcome
  input
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
  if input == "Address"
  elsif input == "Incident"
  else
  puts "I'm sorry I don't recognize that command."
  end
end


end

Cli.new
