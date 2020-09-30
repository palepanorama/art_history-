class Book
    attr_accessor :name, :book_id
    @@all = []

    def initialize(name: nil, input: nil, book_id: nil)
        @name = name 
        @input = input 
        @book_id = book_id 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_input(input)
        self.all.select {|b| b.input == input}
    end 
end 