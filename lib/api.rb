class API 
    def self.get_book(title)
        url = "https://api.lib.harvard.edu/v2/items?collectionTitle=#{title}"
        uri = URI(url)
        response = Net::HTTP.get(uri) 
        books=JSON.parse(response)
        binding.pry
    end 
end 