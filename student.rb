require 'person'
class Student < Person
    def initialize(classroom, param)
        super(param)
        @classroom = classroom
    end    
end

def play_hooky
    "¯\(ツ)/¯"
   end
end