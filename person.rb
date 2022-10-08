require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission, name = 'unkwomn')
    super()
    @id = Random.rand(1..1000),
          @name = name,
          @age = age,
          @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
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
