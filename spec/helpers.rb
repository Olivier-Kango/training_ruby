class Dog
  attr_reader :good_dog, :has_been_walked

  def initialize(good_or_not)
    @good_dog = good_or_not
    @has_been_walked = false
  end

  def walk_dog
    @has_been_walked = true
  end
end

describe Dog do
  it 'should be able to create and walk a good dog' do
    dog = Dog.new(true)
    dog.walk_dog

    expect(dog.good_dog).to be true
    expect(dog.has_been_walked).to be true
  end

  it 'should be able to create and walk a bad dog' do
    dog = Dog.new(false)
    dog.walk_dog

    expect(dog.good_dog).to be false
    expect(dog.has_been_walked).to be true
  end
end

# Subjects
class Person 
  attr_reader :first_name, :last_name 
  
  def initialize(first_name, last_name) 
     @first_name = first_name 
     @last_name = last_name 
  end 
end 

describe Person do 
  it 'create a new person with a first and last name' do
     person = Person.new 'John', 'Smith'
     
     expect(person).to have_attributes(first_name: 'John') 
     expect(person).to have_attributes(last_name: 'Smith') 
  end 
end

# Stubs
class ClassRoom 
  def initialize(students) 
     @students = students 
  end 
  
  def list_student_names 
     @students.map(&:name).join(',') 
  end 
 
end 

describe ClassRoom do 
  it 'the list_student_names method should work correctly' do 
     student1 = double('student') 
     student2 = double('student')
     
     student1.stub(:name).and_return('John Smith')
     student2.stub(:name).and_return('Jill Smith') 
     
     cr = ClassRoom.new [student1,student2] 
     expect(cr.list_student_names).to eq('John Smith,Jill Smith') 
  end 
end

# Hooks
class SimpleClass 
  attr_accessor :message 
  
  def initialize() 
     puts "\nCreating a new instance of the SimpleClass class" 
     @message = 'howdy' 
  end 
  
  def update_message(new_message) 
     @message = new_message 
  end 
end 

describe SimpleClass do 
  before(:each) do 
     @simple_class = SimpleClass.new 
  end 
  
  it 'should have an initial message' do 
     expect(@simple_class).to_not be_nil
     @simple_class.message = 'Something else. . .' 
  end 
  
  it 'should be able to change its message' do
     @simple_class.update_message('a new message')
     expect(@simple_class.message).to_not be 'howdy' 
  end
end

# Tags
# describe "How to run specific Examples with Tags" do 
#   it 'is a slow test', :slow = > true do 
#      sleep 10 
#      puts 'This test is slow!' 
#   end 
  
#   it 'is a fast test', :fast = > true do 
#      puts 'This test is fast!' 
#   end 
# end


# Metadata
RSpec.describe "An Example Group with a metadata variable", :foo => 17 do 
  context 'and a context with another variable', :bar => 12 do 
     
     it 'can access the metadata variable of the outer Example Group' do |example| 
        expect(example.metadata[:foo]).to eq(17) 
     end
     
     it 'can access the metadata variable in the context block' do |example|  
        expect(example.metadata[:bar]).to eq(12) 
     end 
     
  end 
end

# Filtering
RSpec.describe "An Example Group with positive and negative Examples" do 
  context 'when testing Ruby\'s build-in math library' do
     
     it 'can do normal numeric operations' do 
        expect(1 + 1).to eq(2) 
     end 
     
     it 'generates an error when expected' do
        expect{1/0}.to raise_error(ZeroDivisionError) 
     end
     
  end 
end

# RSpec Formatters
RSpec.describe "A spec file to demonstrate how RSpec Formatters work" do 
  context 'when running some tests' do 
     
     it 'the test usually calls the expect() method at least once' do 
        expect(1 + 1).to eq(2) 
     end
     
  end 
end
