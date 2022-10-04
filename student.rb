require './person'
class Student < Person
  def initialize(classroom, name = "unkwomn", age, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
