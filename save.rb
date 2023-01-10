# Open the file, with the open method.

# file = File.open('users.txt')



# Read the file, the whole file, line by line, or a specific amount of bytes.

# file_data = file.read

# file_data = file.readlines.map(&:chomp)

# file.close



# As an alternative to having to open & close the file, you can use the File.read method:

# file_data = File.read('users.txt').split
# p file_data

# File.foreach('users.txt') { |line| puts line }

