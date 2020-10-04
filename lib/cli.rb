class CLI 

    def call
        greeting
        menu 
        goodbye
    end 

    def menu 
        @query = gets.strip.downcase 
        API.get_books(@query)
        print_books
        input = gets.strip.downcase 
        while input != 'exit' 
            if input == 'books'
                print_books
            elsif input.to_i > 0 && input.to_i <= Book.find_by_query(@queries).length
                @book = Book.find_by_query(@queries)[input.to_i - 1]
                print_choice(@book)
                puts "If you'd like to see information on another book from this list, type its number in here.".blue.bold
                puts ""
                puts "To see the list again, type 'books.'".blue.bold
            else 
                puts "I don't understand that. Please try again.".blue.bold
            end  
            input = gets.strip.downcase
            # binding.pry
        end 
    end 

    def greeting 
        puts "Welcome to Matt's Book Finder!".blue.bold
        puts "-----------------------------".blue.bold
        puts ""
        puts "Enter a keyword to search for or type 'exit' to exit".blue.bold
        puts ""
    end 
    
    def prompt
        puts ""
        puts "Select a number to see the details of a book.".blue.bold
        puts ""
    end 


    def print_books
        results = Book.find_by_query(@queries)
        results.each.with_index(1) do |b, i|
            puts "#{i}. #{b.title}".blue.bold
        end 
        prompt 
    end 

    def print_choice(book)
        puts "Title: #{book.title}".blue.bold
        puts ""
        puts "Author: #{book.author[0]}".blue.bold if book.author != nil 
        puts ""
        puts "ISBN: #{book.isbn[0]}".blue.bold if book.isbn != nil 
        puts ""
        puts "Year published: #{book.publish_year[0]}".blue.bold if book.publish_year != nil 
        puts ""
        puts "Subject: #{book.subject}".blue.bold if book.subject != nil 
        puts ""
    end 

    def goodbye 
        puts ""
        puts "Thanks for using Matt's Book Finder!".blue.bold
        puts "-----------------------------------".blue.bold
        puts ""
        puts "Happy reading!".blue.bold
        puts "--------------".blue.bold
        puts ""
    end 


end 

