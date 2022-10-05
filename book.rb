class Book
    attr_accessor :title, :author
    attr_reader :rentals
    def initialize(title, author)
        super()
        @title = title
        @author = author
        @rental = []
    end

    def add_rental(person, date)
        Rental.new(person, date, self)
    end
end