=begin
Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
=end

# input: positive integer
# output: array of digits in the input number
# Pseudocode:
# Given a positive integer, split it into its separate digits and store each as a separate element in an array.
# Return the array.

# After testing a few methods in irb I came up with this solution:

def digit_list(number)
  number.to_s.split('').map { |d| d.to_i }
end


# test
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
