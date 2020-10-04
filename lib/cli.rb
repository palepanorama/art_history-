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
        prompt
        input = gets.strip.downcase
        book = Book.find_by_query(@queries)[input.to_i - 1]
        # binding.pry
        while input != 'exit' 
            if input == 'list'
                print_books
            elsif input.to_i > 0 && input.to_i <= Book.find_by_query(@queries).length
                # input 
                print_choice(book)
            else 
                puts "I don't understand that. Please try again."
            end  
            input = gets.strip.downcase
        end 
        puts ""
        puts "Thanks for using Matt's Book Finder!"
        puts ""
        puts "Happy reading!"
        puts ""
    end 
    

    def prompt
        puts ""
        puts "Select a number to see the details of a book or type 'exit' to exit."
        puts ""
    end 

    def print_books
        results = Book.find_by_query(@queries)
        results.each.with_index(1) do |b, i|
            puts "#{i}. #{b.title}"
        end 
    end 

    def book_author(book_author)
        @book_author = book.author.join("")
    end 

    def print_choice(book)
        puts ""
        puts "#{book.title} by #{@book_author}"
        puts ""

    end 


end 

