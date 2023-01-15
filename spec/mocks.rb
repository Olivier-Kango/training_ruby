# Mocks
# Learning objectives
# Write unit tests with mocks

# Description
# Mocking is a technique that invloves using fake dependent objects or methods for test

# Why are mocks importants?
# They allow you to test code that is non-deterministic, that needs a setup with complex dependencies, or that has a real side-effect(and can't be prevented).

# Mocks
# The idea behind a mock is to test the interaction between two objects, not the result of the interaction.

# How to use Rspec Mocks(Step-By-Step Tutorial)

# To learn more about mocks, read the following articles:

# Mock is an object used for testing
# RSpec Mock Examples

# Here's the ImageFlipper test:
class ImageFlipper
  def initialize(image_processor)
    @image_processor = image_processor
  end

  def flip(file_name)
    @image_processor.flip(file_name)
  end
end


RSpec.describe "Image Filpper" do
  # mock
  it "calls the flip method with the correct arguments" do
    mock = double("mini_magick")
    expect(mock).to receive(:flip).with("ruby.jpg")

    img = ImageFlipper.new(mock)
    img.flip("ruby.jpg")
  end

  # Return a value
  it "return a value" do
    mock = double("mini_magick")
    expect(mock).to receive(:flip).with("ruby.jpg").and_return("ruby-flipped.jpg")

    img = ImageFlipper.new(mock)
    img.flip("ruby.jpg")
  end

  # stub
  # We are allowing our testing object double('json) to receive & respond to this method, but we aren't checking if it's being called!!!
  it "test with stub" do
    stub = double("json")
    allow(stub).to receive(:response) do
      {"blog"=>"rubyguides.com", "rating"=>"5/5"}.to_json
    end
  end
end

# Difference Between Mock & Value Testing
# In the regular test you chech the return value of a method
# When using mock you are testing the behavior

# Mocks vd Stubs
# A stub is only a method with a canned response, it doesn't care about behavior.

# A mock expects methods to be called, if they are not called the test will fail


# How to Mock instance Methods
  # This method is hard to test because of the randmness
class NumberGenerator
  def random
    "A" * rand(1..10)
  end
end

# Rspec allows you to mock, or stub rand
RSpec.describe NumberGenerator do
  context "test NumberGenerator" do
    it "generates a random number" do
      generator = NumberGenerator.new
      allow(generator).to receive(:rand).and_return(5)
      expect(generator.random).to eq("AAAAA")
    end
  end
end
