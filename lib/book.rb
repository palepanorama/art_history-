class Book
    attr_accessor :name, :titleInfo
    @@all = []

    def initialize(name: nil, query: nil, titleInfo: nil)
        @name = name 
        @query = query 
        @titleInfo = titleInfo 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_title(titleInfo)
        self.all.select {|b| b.titleInfo == titleInfo}
    end 
end 