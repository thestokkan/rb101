# Stringy Strings
#
# Write a method that takes one argument, a positive integer,
# and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

# PEDA
# input: positive integer
# output: string of alternating 1's and 0's

# Rules:
# - The output_string.length == integer
# - The output_string should always start with 1

# Data structures:

# Algorithm
# Define a method that takes one argument: a positive integer 'int'.
# Within the method:
  # Initialise an empty string 'output'
  # Create a loop that appends '1' and then '0' to output
  # Quit loop when output is the length of int.
  # Return output.

# Code
def stringy(int)
  output = ''
  loop do
    break if output.size >= int
    output << '1'
    break if output.size >= int
    output << '0'
  end
  output
end

# Tests:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Further Exploration
# Ugly, but it works...
def stringy(int, start = 1)
  output = ''
  if start == 0
    loop do
      break if output.size >= int
      output << '0'
      break if output.size >= int
      output << '1'
    end
  else
    loop do
      break if output.size >= int
      output << '1'
      break if output.size >= int
      output << '0'
    end
  end
  output
end

# Tests:
puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'



# LS solution
# Return '1' if index is even and '0' if index is odd
def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end
