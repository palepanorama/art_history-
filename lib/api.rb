class API 
    def self.get_books(query)
        url = "http://openlibrary.org/search.json?q=#{query}&limit=10"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        books = JSON.parse(response)["docs"].each do |b|
           Book.new(title: b["title"], query: query, subject: b["subject"])

        end 
        return Book.new
        binding.pry

    end 
end 