require_relative './nameable'
require_relative './person'
class Decorator < Nameable

    def initialize(nameable)
        @name = name
    end

    def correct_name
        @nameable
    end
end    