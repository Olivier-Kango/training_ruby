require 'spec_helper'

describe "Library Object" do

  before :all do
    libr_arr = [
      Book.new("JavaScript: The Good Parts", "Douglas Crokford", :development),
      Book.new("Designing with Web Standards", "Jeffrey Zeldam", :design),
      Book.new("Don't Make me Think", "Steve Krug", :usability),
      Book.new("JavaScript Patterns", "Stoyan Stefanov", :development),
      Book.new("Resposiv Web Design", "Ethan", :design)
    ]

    File.open 'books.yml', 'w' do |f|
      f.write YAML::dump libr_arr
    end
  end

  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    context "with no parameters" do
        it "has no books" do
            lib = Library.new
            lib.should have(0).books
        end
    end

    context "with a yaml file parameter" do
      it "has five books" do
        @lib.should have(5).books
      end
    end

    it "returns all books in a given category"
    @lib.get_books
  end
end
