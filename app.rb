require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'person'

class App
  attr_accessor :books, :student, :teacher, :rental, :person

  def initialize
    @books = []
    @student = []
    @teacher = []
    @rental = []
  end

  # list all books
  def list_books
    @books.each_with_index { |book, _i| print " Title: \"#{book.title}\", Author: \"#{book.author}\"\n" }
  end

  # students and teachers
  def list_people
    people = [*@teacher, *@student]
    people.each_with_index { |person, _i| print " Name: \"#{person.name}\", Age: \"#{person.age}\"\n" }
  end

  # create person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [Input the number] : '
    input = gets.chomp.to_i
    case input
    when 1
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      permission = ''
      until %w[Y N].include?(permission)
        print 'Do you have parent permission? [Y/N]:'
        permission = gets.chomp.capitalize
      end
      print 'classrom: '
      classroom = gets.chomp
      new_student = Student.new(age, name, parent_permission, classroom)
      new_student.name = name
      @student.push(new_student)
      puts 'Students created sucessfully '
    when 2
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print ' Enter Specialization: '
      specialization = gets.chomp
      new_teacher = Teacher.new(age, specialization)
      new_teacher.name = name
      @teacher.push(new_teacher)
      puts 'Teacher created succesfully '
    else
      puts 'Wrong Input'
    end
  end

  # create book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book has been created successfully'
  end

  # create rental
  def create_rental
    print "Select a book from the following list by number\n"
    list_books
    book = gets.chomp.to_i
    print "Select a person\n"
    list_people
    person = gets.chomp.to_i
    print 'Date [yyyy/mm/dd]: '
    date = gets.chomp
    people = [*@teacher, *@student]
    new_rental = Rental.new(date, @books[book], people[person])
    @rental.push(new_rental)
    puts 'Rental created successfully'
  end

  # list rentals
  def list_rentals
    print 'Enter person ID: '
    id = gets.chomp.to_i
    @rental.each do |rental|
      if rental.person.id == id
        print "Date: #{rental.date}, Book: \"#{rental.book.title}\" Author #{rental.book.author}\n"
      end
    end
  end
end
