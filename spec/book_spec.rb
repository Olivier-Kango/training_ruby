require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new "title", "author", :category
  end

  describe "#new" do
    it "returns a new book object" do
      expect(@book).to be_an_instance_of Book
    end

    it "takes three prameters and returns a book object" do
      # book = Book.new "Title", "Author"
      # expect(book).not_to be_an_instance_of Book
      lambda { Book.new "Title", "Author" }.should raise_exception ArgumentError
    end
  end
end
