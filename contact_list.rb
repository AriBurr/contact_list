def contacts()

  @contact_list = []

  main_menu()

  while @action != 5

    case @action
      when 1
        if @contact_list.length === 0
          puts "You have no contacts."
        else
          view_contact_list()
        end
          main_menu()
      when 2
        contact_info = {}
        get_contact(contact_info)
        main_menu()
      when 3
        update_contact(contact_info)
        main_menu()
      when 4
        delete_contact()
        main_menu()
      else
        puts "Error - Please Try Again, Human"
        main_menu()
    end

  end

  exit(0)

end

def main_menu()
  puts "------------"
  puts "Contact List"
  puts "------------"
  puts "1) View Contact List"
  puts "2) Add New Contact"
  puts "3) Update Contact Info"
  puts "4) Delete Contact Info"
  puts "5) Exit"
  @action = gets.chomp.to_i
end

def update_menu()
  puts "------------------------------"
  puts "What would you like to update?"
  puts "------------------------------"
  puts "1) Contact Name"
  puts "2) Contact Email"
  puts "3) Contact Phone"
  puts "4) Back to Main Menu"
  @update_action = gets.chomp.to_i
end

def view_contact_list()
  puts "Your Contact List:"
  @contact_list.each_with_index do |hash, i|
    puts "-----Contact #{i + 1}-----"
    puts "Name: #{hash["name"]}"
    puts "Email: #{hash["email"]}"
    puts "Phone: #{hash["phone"]}"
  end
end

def get_contact(contact_info)

  puts "Please input contact's full name:"
  name = gets.chomp
  contact_info["name"] = name.downcase
  puts "Please input contact email:"
  email = gets.chomp
  contact_info["email"] = email
  puts "Please input contact phone #:"
  phone = gets.chomp
  contact_info["phone"] = phone

  @contact_list << contact_info

end

def update_contact(contact_info)

  puts "Please select contact number you'd like to update:"
  view_contact_list()
  update_selection = gets.chomp.to_i

  if (1..(@contact_list.length)).include?(update_selection)

    hash = @contact_list[update_selection - 1]

    update_menu()

    while @update_action != 4
      case @update_action
        when 1
          puts "What is the new contact name?"
          new_name = gets.chomp.downcase
          # puts "You have changed #{hash["name"]} to #{new_name}"
          hash["name"] = new_name
          update_menu()
        when 2
          puts "What is the new contact email?"
          new_email = gets.chomp
          # puts "You have changed #{hash["email"]} to #{new_email}"
          hash["email"] = new_email
          update_menu()
        when 3
          puts "What is the new contact phone #?"
          new_phone = gets.chomp
          # puts "You have changed #{hash["phone"]} to #{new_phone}"
          hash["phone"] = new_phone
          update_menu()
        else
          puts "Error -- Please Try Again, Human"
          update_menu()
      end
    end

  else
    puts "That contact does not exist"
  end

end

def delete_contact()
  if @contact_list.length === 0
    puts "You have no contacts."
  else
    puts "Please select contact number you'd like to delete:"
    view_contact_list()
    update_selection = gets.chomp.to_i
    if (1..(@contact_list.length)).include?(update_selection)
      @contact_list.delete_at(update_selection - 1)
      puts "You deleted 1 contact"
    else
      puts "That is not a valid contact."
    end
  end
end

contacts()
