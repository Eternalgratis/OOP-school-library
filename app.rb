require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'person'
require_relative 'refactoring'

class App
  attr_accessor :books, :rental, :people

  def initialize
    @books = []
    @student = []
    @teacher = []
    @rentals = []
    @people = []
  end

  def start_app(output)
    case output
    when 1 then Book.list_books(@books)
    when 2 then Person.list_people(@people)
    when 3 then Person.create_person(@people)
    when 4 then Book.create_book(books)
    when 5
      create_rental
    when 6
      list_rentals
    end
  end
    
  def run
    user_choice = 0
    menu = List.new
    print 'Welcome to school Library App!'
    while user_choice !=7
      menu.option
      user_choice = gets.chomp.to_i
      start_app(user_choice)
    end
  end 
  
  





  # create rental
  def create_rental
    print "Select a person\n"
    list_people
    person = gets.chomp.to_i
    print "Select a book\n"
    list_books
    book = gets.chomp.to_i
    print 'Date [yyyy/mm/dd]: '
    date = gets.chomp
    people = [*@teacher, *@student]
    new_rental = Rental.new(date, @books[book], people[person])
    @rentals.push(new_rental)
    puts 'Rental created successfully'
  end

  # list rentals
  def list_rentals
    print 'Enter person ID: '
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id == id
        print "Date: #{rental.date}, Book: \"#{rental.book.title}\" Author #{rental.book.author}\n"
      end
    end
  end
end
