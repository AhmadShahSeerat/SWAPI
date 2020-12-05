class Cli

    def start
        puts "Welcome to the amazing starwars API!"
        puts "loading..."
        Api.load_data # all information loaded and models created at this point.
        main_menu_options
    end

    def main_menu_options
        puts "Type '1' to list characters"
        puts "Type '2' to list planets"
        puts "Type 'exit' to exit program"
        main_menu
    end

    def main_menu
        input = get_input

        if input == "1"
            list_characters
            main_menu_options
        elsif input == "2"
            puts "Listing Planets"
        elsif input == "exit"
            puts "Exiting Program"
            exit
        else
            invalid_choice
            main_menu_options
        end
    end

    def invalid_choice
        puts "Invalid Choice. Please Try Again!"
    end

    def get_input
        print "Enter Choice: "
        gets.chomp
    end

    def list_characters
        Character.all.each.with_index(1) do |character, index|
            puts "#{index}. #{character.name}"
        end

        character_details_menu_options
    end

    def character_details_menu_options
        puts "Select the number next to the character you wish to know more about."
        puts "Or type 'exit' to exit program"
        character_details_menu
    end

    def character_details_menu
        input = get_input

        if input.to_i.between?(1, Character.all.length)
            
            index = input.to_i - 1
            character = Character.all[index]
            print_character_details(character)
            select_again_or_exit
        elsif input == "exit"
            puts "Exiting Program"
            exit
        else
            invalid_choice
            character_details_menu_options
        end
    end

    def print_character_details(character)
        puts "-----------------"
        puts "Character Name: #{character.name}"
        puts "Character Birthyear: #{character.birth_year}"
        puts "Character Hair Color: #{character.hair_color}"
        puts "Character Homeworld: #{character.homeworld_url}"
        puts "-----------------"
    end

    def select_again_or_exit
        puts "Would you like to go back to the main menu or exit?"
        puts "'1' for main menu"
        puts "'exit' to exit program"
        input = get_input

        if input == '1'
            main_menu_options
        elsif input == "exit"
            puts "Goodbye!"
            exit
        else
            invalid_choice
            select_again_or_exit
        end
    end
end