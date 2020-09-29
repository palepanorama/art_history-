class CLI 

    def call
        menu 
    end 

    def menu 
        puts "Welcome to Matt's Book Finder!"
        puts "-----------------------------"
        puts ""
        puts "Enter a title to search for or type 'exit' to exit"
        puts ""
        @title = gets.strip.downcase 
        API.get_book(@title)
    end 

 
end 
