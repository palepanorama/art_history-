class API 
    def self.get_books(input)
        url = "https://api.lib.harvard.edu/v2/items.json?q=#{input}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        books = JSON.parse(response)
        binding.pry

        # ["books"].each do |b|
        #Book.new(name: b["strBook"], book_id: b["idBook"], input: input) if b["strBook"] != nil
        

    end 
end 