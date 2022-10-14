class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(person, book, date)
    super()
    @person = person
    book.rentals
    @date = date
    person.rentals
    @book = book
  end
end
