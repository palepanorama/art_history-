class API 
    def self.get_books(query)
        url = "http://openlibrary.org/search.json?q=#{query}&limit=10"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        books = JSON.parse(response)

        binding.pry

    end 
end 