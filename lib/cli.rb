class CLI 

    def call
        menu 
    end 

    def menu 
        puts "Welcome to Matt's Book Finder!"
        puts "-----------------------------"
        puts ""
        puts "Enter a keyword to search or type 'exit' to exit"
        puts ""
        @query = gets.strip.downcase 
        API.get_books(@query)
        print_books
        end 
    end 

    def print_books 
        Book.all.each.with_index(1) do |b, i|
            puts "#{i}. #{b.title}"
    end 


 
end 
