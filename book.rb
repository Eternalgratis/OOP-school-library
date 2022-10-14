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
  
  # create book
  def self.create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books.push(book)
    puts 'Book has been created successfully'
  end

  # list all books
  def self.list_books(books)
    if books.empty?
      print 'There are no books '
    else
      books.each_with_index do |book, index|
        print " (#{index}) Title: #{book.title} Author: #{book.author}"
      end
    end
  end
end
