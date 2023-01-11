# Open the file, with the open method.

file = File.open('users.txt')



# Read the file, the whole file, line by line, or a specific amount of bytes.

file_data = file.read

file_data = file.readlines.map(&:chomp)

file.close



# As an alternative to having to open & close the file, you can use the File.read method:

file_data = File.read('users.txt').split
p file_data

File.foreach('users.txt') { |line| puts line }




# HOW TO WRITE TO A FILE IN RUBY
# 1. Open the file in write mode("w" flag)
File.open('log.txt', 'w') { |f| f.write "#{Time.now} - User logged in\n" }
# (If you want to add new content to the file, use the “a” (append) flag, instead of the “w” (write) flag. 

# One shortcut is to use File.write:)
File.write('log.txt', 'data...')

File.write('log.txt', 'data...', mode: "a")

# Write an array, we have to convert in to a string
File.write('log.txt', [1,2,3].join('\n'), mode: "a")

# p File.read('log.txt')


# 2. Use the write method to add data to the file
# 3. If you didn't use the block version, remember to close.




# Ruby File Methods
  # rename
  File.rename('old-name.txt', 'new-name.txt')

  # size
  File.size('users.txt')

  # exists?
  File.exists?('log.txt')

  # extname
  File.extraname('users.txt')

  # basename
  File.basename('/tmp/ebook.pdf')

  # dirname
  File.dirname('/tmp/ebook.pdf')

  # directory?
  File.directory?('cats')

  # file?

  def find_files_in_current_directory
    entries = Dir.entries(".")
  
    entries.reject { |entry| File.directory?(entry) }
  end

  File.stat("/tmp")



# DIRECTORY OPERATIONS

  # All files in current directory
Dir.glob("*")

# All files containing "spec" in the name
Dir.glob("*spec*")

# All ruby files
Dir.glob("*.rb")

# Current directory
Dir.glob("**/**")
Dir.glob("**/**/")

# Print the current working directory
Dir.pwd

# Check if a directory is empty:
Dir.empty?("/tmp")
# false

# Check if a directory exists:
Dir.exists?("/home/jesus")
# true

# Create a new directory:
Dir.mkdir("/tmp/testing")

# Create a temporary directory with mktmpdir:
Dir.mktmpdir do |dir|
  File.write(dir + "/log.txt", "test")
end




# HOW TO USE THE FILEUTILS MODULE
require 'fileutils'

FileUtils.compare_file("a.txt", "b.txt")
FileUtils.touch("/tmp/lock")
FileUtils.cp_r("data", "backup")
