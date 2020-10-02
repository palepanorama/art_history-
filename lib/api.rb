class API 
    def self.get_books(query)
        url = "http://openlibrary.org/search.json?subject=#{query}&limit=10"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        books = JSON.parse(response)["docs"]
         books.each do |b|
            if !Book.all.find{|book| book.title.downcase == b["title"].downcase}
                Book.new(title: b["title"], author: b["author_name"].join(" "), subject: b["subject"][0]) 
             end 
        end 


       #binding.pry

    end 
end 