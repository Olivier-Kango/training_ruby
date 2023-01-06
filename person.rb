require './nameable'
require './capitalizeDecorator'
require './trimmerDecorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :age, :name

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? or @parent_permission
  end

  def correct_name
    @name
  end
end
