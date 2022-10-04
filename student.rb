require './person'
class Student < Person
  def initialize(classroom, age, name = 'unkwomn', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
