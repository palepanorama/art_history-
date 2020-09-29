class Books::CLI 

    def call 
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
        puts "Choose which text you want more information on or type exit to enter:"
        input = nil 
        while input != "exit"
            input = gets.strip.downcase  
            case input 
            when "1"
                puts "More info on deal 1..."
            when "2"
                puts "More info on deal 2..."
            end 
        end 
    end 

    def goodbye 
        puts "Peace, fool!"
    end 
end 
