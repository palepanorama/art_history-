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
        binding.pry
        prompt
        input = gets.strip.downcase
        while input != 'exit' do 
            if input == 'book'
                @query = gets.strip.downcase 
                API.get_books(@query) if Book.find_by_query(@query).length == 0
                print_books
            elsif input.to_i > 0 && input.to_i <= Book.find_by_query(@query).count
                book = Book.find_by_query(@query)[input.to_i - 1]
                API.get_book(book) if !book.isbn
                print_book(book)
            else 
                puts "I don't understand that. Please try again."
            end 
            input = gets.strip.downcase
        end 
        puts "Thanks for using Matt's Book Finder!"
        puts "Happy reading!"
    end 

    def prompt
        puts ""
        puts "Select a number to see the details of a book or type 'exit' to exit."
        puts ""
    end 

    def print_books
        Book.find_by_query(@query).each.with_index(1) do |b, i|
            puts "#{i}. #{b.title}"

        end 
    end 

    def print_book(book)
    end 


end 

