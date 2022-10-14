require './person'
class Student < Person
  attr_accessor :classroom, :id, :parent_permission
  def initialize(classroom, *args)
    super(*args)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  # def classroom=(classroom)
  #   @classroom = classroom
  #   classroom.students.push(self) unless classroom.students.include?(self)
  # end

  def self.create_student
    print 'Classroom: '
    classroom = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Do you have parent permission? [Y/N]:'
    permission = gets.chomp
    has_permission = case
      permission.downcase
      when 'y'
        true
      else 
        false
      end
    Student.new(classroom, age, name, parent_permission: has_permission)
  end  
end  

