require './nameable'
require './person'

class Decorator < Nameable
  def initialize(nameable)
    super()
    @name = name
  end

  def correct_name
    @nameable
  end
end
