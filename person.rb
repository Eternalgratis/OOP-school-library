require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :rentals, :id

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
          @name = name
          @age = age
          @parent_permission = parent_permission
          @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  # students and teachers
  def self.list_people(people)
    if people.empty?
      puts 'There are no people yet.'
    else
      # people = [@teacher, @student]
      people.each_with_index do |person, index|
        puts "#{index} ) [ #{person.classroom}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end
  
  # create person which in this case is teacher and student
  # def add_new_student(student)
  #   @people << student
  # end
  
  # def add_new_teacher(teacher)
  #   @people << teacher
  # end
  
  def self.create_person(people)
    print 'Do you want to create a student (1) or a teacher (2) [Input the number] : '
    person_option = gets.chomp.to_i
    case person_option
    when 1
      person = Student.create_student
    when 2
      person = Teacher.create_teacher
    else
      puts 'Wrong Input'
    end
    people << person
    puts "#{person.class} created sucessfully "
  end

  private :of_age?

  def can_use_services?
    if of_age? || parent_permission
      true
    else
      false
    end
  end
end
