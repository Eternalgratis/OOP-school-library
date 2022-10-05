class Rental
    attr_accessor :person :book :date

    def initialize(person, book, date)
        super()
        @person = person
        person.rentals << self
        @book = book
        book.rentals << self
       @date = date
    end
end