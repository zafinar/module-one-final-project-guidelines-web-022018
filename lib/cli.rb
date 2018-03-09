require 'pry'

#Features to implement: Group BY Date
# SPLIT RETURN ADDRESSES SO I CAN SEARCH RANGE




class Cli
  def initialize

    intro
    call
  end

  def intro
    a = Artii::Base.new
    puts a.asciify("NYC  311  CALL  SEARCH")
    puts "Welcome to the NYC 311 call search."
  end

  def call
    welcome
    input_check
    end
  end


  def welcome

    puts "Type 'Address' to search by address."
    puts "Type 'Incident' to search by incident type."
    puts "Type 'API' to update the searched database."
    puts "Type 'Exit' to exit the program."
    puts "Type 'Help' to repeat the possible commands."
    puts "Type 'Complaints' to get a list of complaint types."
  end

  def input
    gets.chomp
  end

  def input_check
    idx = 0
    until idx == 1
      i = input.downcase
      if i == "address"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Enter the address."
        result = Address.find_by(incident_address: input)
          if result == nil
              puts "0 results."
            else

            complaint = result.complaint.map{|i| i.complaint_type}
            complaint = Hash[complaint.group_by {|x| x}.map{|key,value| [key,value.count]}]
            complaint.each{|key,value| puts "There #{value > 1 ? 'were' : 'was'} #{value} '#{key}' #{value > 1 ? 'complaints' : 'complaint'} at this location."}
            # binding.pry
            # puts "There were #{complaint.length} "
            puts "Would you like to see the complaint details?(Y/N)"
              if input.downcase == "y"
            id = result.complaint_address_ids
            # binding.pry
            id = id.map{|i| ComplaintAddress.find(i).descriptor}.join(", ")
            puts "The complaints were: #{id}"
              end
            # puts result.complaint_address.descriptor
            # binding.pry
          end
      elsif i == "incident"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Enter the complaint type."
        result = Complaint.find_by(complaint_type: input)
        if result == nil
            puts "0 results."
        else
          address = result.address.map{|i| i.incident_address}
          address = Hash[address.group_by {|x| x}.map{|key,value| [key,value.count]}]
          address.each{|key,value| puts "There #{value > 1 ? 'were' : 'was'} #{value} #{value > 1 ? 'complaints' : 'complaint'} at '#{key}' for this complaint type."}
          puts "Would you like to see the complaint details?(Y/N)"
            if input.downcase == "y"
          id = result.complaint_address_ids
          id = id.map{|i| ComplaintAddress.find(i).descriptor}
          id = Hash[id.group_by{|x| x}.map{|key,value| [key,value.count]}]
          id.each{|key,value| puts "There #{value > 1 ? 'were' : 'was'} #{value} #{value > 1 ? 'complaints' : 'complaint'} described as '#{key}'."}

            end
          # binding.pry
        end
      elsif i == "api"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        api = Api.new
        api.create_join_table


      elsif i == "exit"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Have a nice day."
        idx +=1
        break

      elsif i == "help"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        welcome

      elsif i == "complaints"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts Complaint.all.map{|c| c.complaint_type}.uniq



      else
      puts "I'm sorry I don't recognize that command."
      call
      end

   end

  end
