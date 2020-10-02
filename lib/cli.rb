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
        books = Book.all 
        books.each.with_index(1) do |b, i|
            puts "#{i}. #{b.title} - #{b.author}"
        end 
    end 

 
end 
