require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new "Title", "Author", :category
  end

  describe "#new" do
    it "returns a new book object" do
      expect(@book).to be_an_instance_of Book
    end

    it "takes three prameters and returns a book object" do
      expect { Book.new "Title", "Author" }.to raise_error ArgumentError
    end
  end

  describe "#title" do
    it "returns the correct title" do
      expect(@book.title).to eql "Title"
    end

    it "returns the correct title" do
      expect(@book.author).to eql "Author"
    end

    it "returns the correct title" do
      expect(@book.category).to eql :category
    end
  end
end
