require './person'

class Student < Person
  attr_reader :parent_permission
  attr_accessor :classroom, :name, :age

  def initialize(classroom, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
