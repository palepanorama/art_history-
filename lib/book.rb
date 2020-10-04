class Book
    attr_accessor :title, :author, :subject, :isbn, :publish_year, :query 
    @@all = []

    def initialize(attrs)
        attrs.each do |key, value|
            self.send "#{key}=", value
        end 
        @queries = []
        @@all << self  
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_query(query)
        self.all.select{|b| b.query == query}
     end 

end 