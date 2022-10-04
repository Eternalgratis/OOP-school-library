require 'person'
class Teacher < Person
    def initialize(specialization, param)
        super(param)
        @specialization = specialization
    end
        
  end
end

def can_use_services?
    true
  end
end