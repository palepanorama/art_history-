class Book
    attr_accessor :title, :author, :subject 
    @@all = []

    def initialize(attrs)
        attrs.each do |key, value|
            self.send "#{key}=", value
        end 
        @@all << self  
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_title(title)
        self.all.select {|b| b.title == title}
    end 
end 