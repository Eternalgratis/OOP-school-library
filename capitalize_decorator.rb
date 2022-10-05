require './base_decorator'

class CapitalizeDecorator < Decorator
  
  def correct_name
    @nameable.correct_name.capitalize
  end
end
puts correct_name
