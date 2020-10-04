class CLI 

    def call
        menu 
    end 

    def menu 
        greeting
        @query = gets.strip.downcase 
        API.get_books(@query)
        print_books
        prompt
        input = gets.strip.downcase
        book = Book.find_by_query(@queries)[input.to_i - 1]
        while input != 'exit' 
            if input == 'list'
                print_books
            elsif input.to_i > 0 && input.to_i <= Book.find_by_query(@queries).length
                print_choice(book)
            else 
                puts "I don't understand that. Please try again."
            end  
            input = gets.strip.downcase
        end 
        goodbye
    end 

    def greeting 
        puts "Welcome to Matt's Book Finder!"
        puts "-----------------------------"
        puts ""
        puts "Enter a keyword to search, type 'list' to see the list again, or type 'exit' to exit"
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

    def print_choice(book)
        puts ""
        puts "#{book.title} by #{book.author[0]}"
        puts ""
        puts "ISBN: #{book.isbn[0]}"
        puts ""
        puts "Year published: #{book.publish_year[0]}"
        puts ""
        puts "Subject: #{book.subject}"
        puts ""
    end 

    def goodbye 
        puts ""
        puts "Thanks for using Matt's Book Finder!"
        puts ""
        puts "Happy reading!"
        puts ""
    end 


end 

