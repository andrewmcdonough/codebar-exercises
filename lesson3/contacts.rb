#!/usr/bin/env ruby

require 'pstore'

@data = PStore.new("contacts.pstore")

@data.transaction do
  @data["contacts"] ||= []
  @data.commit
end

def display_instructions
  puts %Q{
    -----
    1 Add a contact
    2 Retrieve a contact's birthday
    3 List contacts
    4 Exit
    ----- 
  }
end

def unknown_command
  puts "Unknown command"
end

def add_a_contact
  puts "Name:"
  name = gets.strip
  puts "Birthday:"
  birthday = gets.strip
  @data.transaction do
     @data["contacts"] << {name: name, birthday: birthday}
     @data.commit
  end
end

def retrieve_birthday
  puts "Name:"
  name = gets.strip
  @data.transaction do
    @data["contacts"].each do |contact|
      if name == contact[:name]
        puts contact[:birthday]
        return
      end
    end
    puts "No contact found"
  end
end

def list_contacts
  @data.transaction do
    @data["contacts"].each do |contact|
      puts contact[:name]
    end
  end
end


while(true) do
  display_instructions
  case gets.strip
  when "1" then add_a_contact
  when "2" then retrieve_birthday
  when "3" then list_contacts
  when "4" then  exit
  else unknown_command
  end
end



