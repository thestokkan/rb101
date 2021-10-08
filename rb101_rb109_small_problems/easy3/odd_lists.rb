
# Odd Lists

# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument. The values in the returned list
# should be those values that are in the 1st, 3rd, 5th, and so on elements of
# the argument Array.

# Algorithm
# Select elements based on index:
# Initialize an array to hold the odd values
# Set index variable to 0
# Loop through the array passed as an argument
#   Save the element at current index to the new array
#   Increase index by 2
# Return new array when loop is done

def oddities(arr)
  odds = []
  idx = 0
  loop do
    odds << arr[idx] unless arr.empty?
    idx += 2
    break if idx >= arr.length
  end
  odds
end


def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end


# Examples:

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
