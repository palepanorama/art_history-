class API 
    def self.get_books(query)
        url = "http://openlibrary.org/search.json?subject=#{query}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        books = JSON.parse(response)["docs"]
         books.each do |b|
            if !Book.all.find{|book| book.title.downcase == b["title"].downcase}
                Book.new(title: b["title"], author: b["author_name"], subject: b["subject"][0], isbn: b["isbn"], publish_year: b["publish_year"]) 
             end 
        end 
    end 

    def self.get_book(book)
        url = "http://openlibrary.org/search.json?isbn=#{isbn}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        book_info = JSON.parse(response)["docs"][0]
        book.isbn = book_info["isbn"]
        book.author = book_info["author_name"]
        book.subject = book_info["subject"]
    end 
end 