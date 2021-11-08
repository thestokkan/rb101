#
# Odd Lists
#
# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument. The values in the returned list should
# be those values that are in the 1st, 3rd, 5th, and so on elements of the argument
# Array.


## Answer
# PEDAC
#
# UNDERSTAND THE PROBLEM
# - Input: array of objects
# - Output: array of objects
# - Requirements
#   - Explicit:
#     - output array contains every other element of input array
#     - 1st, 3rd, 5th, etc. -> index 0, 2, 4, etc.
#   - Implicit:
#     - empty array in -> empty array out
#     - one element -> return that element
#
# EXAMPLES/EDGE CASES
# See provided examples
#
#
# ALGORITHM 1: basic loop
# 1. Initialize an array 'output' to holt the selected values
# 2. Initialize a counter: index = 0
# 3. Loop through the input array
#   a. Exit loop if the counter is larger than input array length
#   b. Add the element at index to output array
#   c. Increment the counter by 2
# 4. Return output array
# CODE

def oddities(arr)
  odd_values = []
  index = 0

  loop do
    break if index >= arr.size
    odd_values << arr[index]
    index += 2
  end
  odd_values
end

# Test cases:

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []


# Further Exploration
#
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
puts
puts "Evens"
def evens(arr)
  even_values = []
  index = 1

  loop do
    break if index >= arr.size
    even_values << arr[index]
    index += 2
  end
  even_values
end

p evens([2, 3, 4, 5, 6])
p evens([1, 2, 3, 4, 5, 6])

# Try to solve this exercise in at least 2 additional ways.
puts
puts "Oddities 2"
def oddities2(arr)
  odd_values = []

  arr.each_with_index do |value, i|
    next if i.odd?
    odd_values << value
  end
  odd_values
end

puts oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities2(['abc', 'def']) == ['abc']
puts oddities2([123]) == [123]
puts oddities2([]) == []

puts
puts "Oddities 3"
def oddities3(arr)
  arr.select.with_index do |value, i|
    i.even?
  end
end

puts oddities3([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities3(['abc', 'def']) == ['abc']
puts oddities3([123]) == [123]
puts oddities3([]) == []
