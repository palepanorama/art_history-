class CLI 

    def call
        menu 
    end 

    def menu 
        greeting
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
                puts "If you'd like to see information on another book from this list, type its number in here."
                puts ""
                puts "To see the list again, type 'books.'"
            else 
                puts "I don't understand that. Please try again."
            end  
            input = gets.strip.downcase
            # binding.pry
        end 
        goodbye 
    end 

    def greeting 
        puts "Welcome to Matt's Book Finder!"
        puts "-----------------------------"
        puts ""
        puts "Enter a keyword to search or type 'exit' to exit"
        puts ""
    end 
    
    def prompt
        puts ""
        puts "Select a number to see the details of a books."
        puts ""
    end 


    def print_books
        results = Book.find_by_query(@queries)
        results.each.with_index(1) do |b, i|
            puts "#{i}. #{b.title}"
        end 
        prompt 
    end 

    def print_choice(book)
        puts "Title: #{book.title}"
        puts ""
        puts "Author: #{book.author[0]}" if book.author != nil 
        puts ""
        puts "ISBN: #{book.isbn[0]}" if book.isbn != nil 
        puts ""
        puts "Year published: #{book.publish_year[0]}" if book.publish_year != nil 
        puts ""
        puts "Subject: #{book.subject}" if book.subject != nil 
        puts ""
    end 

    def goodbye 
        puts ""
        puts "Thanks for using Matt's Book Finder!"
        puts "-----------------------------------"
        puts ""
        puts "Happy reading!"
        puts "-------------"
        puts ""
    end 


end 

