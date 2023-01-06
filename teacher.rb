require './person'

class Teacher < Person
  attr_reader :parent_permission
  attr_accessor :specialization, :name, :age

  def initialize(specialization, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
