# output

# require 'pry'
# input = $stdin.gets

# To create a new IO object, we need a file descriptor.
# In this case, 1(stdout)
# io = IO.new(1)
# puts io

# binding.pry

# [1] pry(main)> fd = IO.sysopen('/dev/null', 'w+')
# => 8
# [2] pry(main)> dev_null = IO.new(fd)
# => #<IO:fd 8>
# [3] pry(main)> dev_null.puts 'hello'
# => nil
# [4] pry(main)> dev_null.gets
# => nil
# [5] pry(main)> dev_null.close
# => nil

# POSITION
# fd = IO.sysopen '/D/lorem.txt'

# puts fd

class SystemTask
  def initialize(io=$stdout)
    @io = io
  end

  def execute
    @io.puts "preparing to execute"

    @io.puts "preparing to execute"
    # first_task

    @io.puts "starting second task"
    # second_task

    @io.puts "execution complete"
  end
end

system = SystemTask.new
system.execute
