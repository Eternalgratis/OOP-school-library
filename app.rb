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
    @rentals = []
    @people = []
  end

  # list all books
  def list_books
    if @books.length.zero?
      print 'There are no books '
    else
    @books.each_with_index { |book, index| print " (#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\"\n" }
    end
  end

  # students and teachers
  def list_people
    if @people.length.zero?
      puts 'There are no people yet '
    else
    people = [*@teacher, *@student]
    people.each_with_index { |person, index| puts " (#{index}) [#{person.class}] Age: \"#{person.age}\", Name: \"#{person.name}\", ID: \"#{person.id}\"\n" }
    end
  end

  # create person which in this case is teacher and student
  def add_new_student(student)
    @people << student
  end
  def add_new_teacher(teacher)
    @people << teacher
  end
  def create_person
    person_option = 0
    until [1, 2].include? person_option
    print 'Do you want to create a student (1) or a teacher (2) [Input the number] : '
    person_option = gets.chomp.to_i
    end
    case person_option
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
      print 'classroom: '
      classroom = gets.chomp
      student = Student.new(age, name, parent_permission: permission == 'Y')
      add_new_student(student)
      # new_student = Student.new(age, name, permission, classroom)
      # new_student.name = name
      # @student.push(new_student)
      puts 'Students created sucessfully '
    when 2
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print ' Enter Specialization: '
      specialization = gets.chomp
      # teacher = Teacher.new(age, name, specialization)
      # add_new_teacher(teacher)
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
