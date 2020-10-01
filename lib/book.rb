class Book
    attr_accessor :title, :author, :subject, :query  
    @@all = []

    def initialize(attributes)
        attributes.each {|key, value| self.send(("#{key}="), value)}
        @@all << self  
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_title(title)
        self.all.select {|b| b.title == title}
    end 
end 