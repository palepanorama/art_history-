require 'pry'

class CLI 

    def initialize
        list_texts 
        menu 
        goodbye
    end 

    def list_texts 
        puts "Texts available:"
        puts "1. blah"
        puts "2. blahblah"
    end 

    def menu 
        input = nil 
        while input != "exit"
            puts "Choose which text you want more information on or type exit to enter:"
            input = gets.strip.downcase  
            case input 
            when "1"
                puts "More info on text 1..."
            when "2"
                puts "More info on text 2..."
            end 
        end 
    end 

    def goodbye 
        puts "Happy reading!"
    end 
end 
