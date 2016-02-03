#class World


@politicians = [
  { name: "Rubio",
    party: "Republican" },
  { name: "Bernie",
    party: "Democrat" }
  ]
@voters = [
  { name: "Bob",
    politics: "Tea Party" },
  { name: "Larry",
    politics: "Liberal" }
  ]


def pretty_display

  @politicians.each do |member|
    puts "* Politician, #{member[:name]}, #{member[:party]} "
  end

  @voters.each do |member|
    puts "* Voter, #{member[:name]}, #{member[:politics]} "
  end
end



def finish
  puts "Are you satisfied...yet?"
  puts "(Y)es or (N)o"
  input = gets.strip.downcase
  if input == "y"
    puts "THANK YOU"
    exit
  elsif input == "n"
    main_menu
  else
    puts "I'm not sure what to do here"
    main_menu
  end
end



def put_a_line
  puts "\n"
  puts "/\\" * 40
  puts "\n"
end



def main_menu
  put_a_line
  puts "What would you like to do?"
  puts "(C)reate, (L)ist, (U)pdate, or (D)elete"
  put_a_line
  main_menu_selection = gets.chomp.downcase

  case main_menu_selection
    when "c"
      create
    when "l"
      list
    when "u"
      update
    when "d"
      delete
    else
      puts "Invalid entry."
      main_menu
  end
end



def create

  put_a_line
  puts "What would you like to create? Choose a letter."
  puts "(P)olitician or (V)oter"
  put_a_line
  create_selection = gets.chomp.downcase
  if create_selection == "p"
    print "Enter Politicians FIRST and LAST name:  "
    p_name = gets.split.each{|i| i.capitalize!}.join(' ')
    print """Enter the new political party:
    (R)epublican, (D)emocrat
    """
    p_party = gets.strip.downcase
    if p_party == "r"
      p_party = "Republican"
      @politicians << {name: p_name, party: p_party }
    elsif p_party == "d"
      p_party = "Democrat"
      @politicians << {name: p_name, party: p_party }
    else
      puts "Please try again"
      create
    end

  elsif create_selection == "v"
      print "Enter Voter's FIRST and LAST name: "
      v_name = gets.split.each{|i| i.capitalize!}.join(' ')
      print """Enter the new political view:
      (C)onservative, (L)iberal, (S)ocialist,
      (T)ea Party, or (N)eutral
      """
      v_party = gets.strip.downcase
      if v_party == "c"
        v_party = "Conservative"
        @voters << {name: v_name, politics: v_party }
      elsif v_party == "l"
        v_party = "Liberal"
        @voters << {name: v_name, politics: v_party }
      elsif v_party == "s"
        v_party = "Socialist"
        @voters << {name: v_name, politics: v_party }
      elsif v_party == "t"
        v_party = "Tea Party"
        @voters << {name: v_name, politics: v_party }
      elsif v_party == "n"
        v_party = "Neutral"
        @voters << {name: v_name, politics: v_party }
      else
        puts "Please try again"
        create
      end
    else
      puts "Invalid entry"
      create
  end
  finish
end



def list
  put_a_line
  pretty_display
  # puts "Would you like to list politicians or voters?"
  # puts "(P)olitician", "(V)oter"
  #
  # answer = gets.strip.downcase
  # if answer == "p"
  #   puts @politicians
  # elsif answer == "v"
  #   puts @voters
  # else
  #   puts "Invalid entry."
  #   update
  # end
  put_a_line
  finish
end



def update
  put_a_line
  puts "Who would you like to update?"
  print "Full Name: "
  select_name = gets.split.each{|i| i.capitalize!}.join(' ')
#searches the hashes value name within the politicians array
  if @politicians.find {|i| i[:name] == select_name}
    puts "What would you like to update?"
    puts "Options: (N)ame, (P)arty, or (B)oth"
    options = gets.strip.downcase

    case options
      when "n"
        print "Enter the new FIRST and LAST name: "
        new_name = gets.split.each{|i| i.capitalize!}.join(' ')
        @politicians.each {|k| k[:name] = new_name if k[:name] == select_name}
        finish
      when "p"
        print """Enter the new political party:
        (R)epublican, (D)emocrat
        """
        new_politics = gets.strip.downcase
        if new_politics == "r"
          new_politics = "Republican"
          @politicians.each {|k| k[:party] = new_politics if k[:name] == select_name}
          finish

        elsif new_politics == "d"
          new_politics = "Democrat"
          @politicians.each {|k| k[:party] = new_politics if k[:name] == select_name}
          finish

        else
          puts "Please try again"
          update
        end


      when "b"

        print "Enter the new FIRST and LAST name: "
        new_name = gets.split.each{|i| i.capitalize!}.join(' ')

        print """Enter the new political party:
        (R)epublican, (D)emocrat
        """
        new_politics = gets.strip.downcase

        if new_politics == "r"
          new_politics = "Republican"
          @politicians.each {|k| k[:party] = new_politics if k[:name] == select_name}

        elsif new_politics == "d"
          new_politics = "Democrat"
          @politicians.each {|k| k[:party] = new_politics if k[:name] == select_name}

        else
          puts "Please try again"
          update
        end

        @politicians.each {|k| k[:name] = new_name if k[:name] == select_name}

        finish

      else
        puts "Invalid entry."
        update
      end
#searches the hashes value name within the voters array
  elsif @voters.find {|i| i[:name] == select_name}

    puts "What would you like to update?"
    puts "Options: (N)ame, (P)olitics, or (B)oth"

    options = gets.strip.downcase
    case options
      when "n"
        print "Enter new FIRST and LAST name: "
        new_name = gets.split.each{|i| i.capitalize!}.join(' ')
        @voters.each {|k| k[:name] = new_name if k[:name] == select_name}
        finish

      when "p"
        print """Enter the new political view:
        (C)onservative, (L)iberal, (S)ocialist,
        (T)ea Party, or (N)eutral
        """
        new_politics = gets.strip.downcase
        if new_politics == "c"
          new_politics = "Conservative"

        elsif new_politics== "l"
          new_politics = "Liberal"

        elsif new_politics == "s"
          new_politics = "Socialist"

        elsif new_politics == "t"
          new_politics = "Tea Party"

        elsif new_politics == "n"
          new_politics = "Neutral"

        else
          puts "Please try again"
          update
        end

        @voters.each {|k| k[:politics] = new_politics if k[:name] == select_name}
        finish

      when "b"
        print "Enter the new FIRST and LAST name: "
        new_name = gets.split.each{|i| i.capitalize!}.join(' ')


        print """Enter the new political view:
        (C)onservative, (L)iberal, (S)ocialist,
        (T)ea Party, or (N)eutral
        """
        new_politics = gets.strip.downcase
        if new_politics == "c"
          new_politics = "Conservative"
          @voters.each {|k| k[:politics] = new_politics if k[:name] == select_name}

        elsif new_politics== "l"
          new_politics = "Liberal"
          @voters.each {|k| k[:politics] = new_politics if k[:name] == select_name}

        elsif new_politics == "s"
          new_politics = "Socialist"
          @voters.each {|k| k[:politics] = new_politics if k[:name] == select_name}

        elsif new_politics == "t"
          new_politics = "Tea Party"
          @voters.each {|k| k[:politics] = new_politics if k[:name] == select_name}

        elsif new_politics == "n"
          new_politics = "Neutral"
          @voters.each {|k| k[:politics] = new_politics if k[:name] == select_name}

        else
          puts "Please try again"
          update
        end

        @voters.each {|k| k[:name] = new_name if k[:name] == select_name}
        finish


      else
        puts "Invalid entry."
        update
      end

    else
      puts "User not in database"
      puts "Would you like to add a name?"
      puts "(Y)es or (N)o?"
      add_name = gets.strip.downcase
      if add_name == "y"
        p "call create method here"
        create
      elsif add_name == "n"
        main_menu
      else
        puts "Fuck you"
        main_menu
    end
    finish
  end
end



def delete
    put_a_line
    puts "Who would you like to delete?"
    print "Name: "
    select_name = gets.split.each{|i| i.capitalize!}.join(' ')
    if @voters.find {|i| i[:name] == select_name} || @politicians.find {|i| i[:name] == select_name}
      puts "Are you sure? (Y)es or (N)o"
      delete_entry = gets.strip.downcase
      if delete_entry == "y"
        @politicians.delete_if { |i| i[:name] == select_name }
        @voters.delete_if { |i| i[:name] == select_name }
        puts "#{select_name} has successfully been deleted."
      elsif delete_entry == "n"
        main_menu
      else
        puts "Invalid entry"
        delete
      end
    else
      puts "Invalid entry"
      delete
    end
    finish
  end
# end


main_menu
