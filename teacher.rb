require './Person'
class Teacher < Person
  def initialize(specialization, age, name = 'unkwomn', parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
