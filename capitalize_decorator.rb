require_relative './base_decorator'

class Capitalize_decorator < Decorator

    def correct_name
        @nameable.correct_name.capitalize
    end
end