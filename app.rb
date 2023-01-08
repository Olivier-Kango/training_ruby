class App
  attr_accessor :command, :books, :people

  def initialize
    @command = {
      '1': 'List all books',
      '2': 'List all people',
      '3': 'Create a person',
      '4': 'Create a book',
      '5': 'Create a rental',
      '6': 'List all rentals for a given person id',
      '7': 'Exist'
    }

    @books = ['Holy Ghost']

    @people = []
  end

  def display_command
    @command.each do |key, value|
      puts "#{key} - #{value}"
    end
  end

  def list_all_book
    books.each_with_index do |book, index|
      puts "#{index}) #{book}"
    end
  end

  def options(option)
    case option
    when 1 then list_all_book
    end
  end

  def choose_options
    option = gets.chomp.to_i
    if option == 7
      puts "Thanks for have visited our App!!"
      exit
    else
      options(option)
    end
  end

  def run
    display_command
    choose_options
    puts
  end
end
