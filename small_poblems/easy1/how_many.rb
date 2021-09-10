# Write a method that counts the number of occurrences of each element in a given array.
#
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
#
# count_occurrences(vehicles)
#
# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.
#
# Expected output:
#
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# ANSWER
# input:  array of string elements, some which are duplicates
# output: print unique strings from the input array along with the number of instances of that string
# Note: Words are case-sensitive

# Pseudocode:
# Given an array of strings.
# Create a new structure to hold the output data
# Loop through the vehicles array one item at a time.
# - For each item, check if it exists in the new datastructure.
#   - If it does not, add it to the structure and set its counter to 1
#   - If it does, update its counter by 1
# Print the items in the new data structure along with its respective count


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# Option
def count_occurrences(arr)
  count = {}

  arr.uniq.each { |vehicle| count[vehicle] = 0 }

  arr.each do |item|
      count[item] += 1
  end

  count.each do |vehicle, number|
    puts "#{vehicle} => #{number}"
  end
end


count_occurrences(vehicles)


# Case insensitive
def count_occurrences(arr)
  arr = arr.map(&:downcase)
  count = {}

  arr.uniq.each { |vehicle| count[vehicle] = 0 }

  arr.each do |item|
      count[item] += 1
  end

  count.each do |vehicle, number|
    puts "#{vehicle} => #{number}"
  end
end

vehicles = [
  'car', 'CAR', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'Motorcycle', 'car', 'truck'
]
count_occurrences(vehicles)



# LS solution
def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element) # Didn't remember this method
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end


# Methods from students solutions
def count_occurrences(arr)
  answer = Hash.new(0)
  arr.each { |item| answer[item] += 1}
  answer.each {|key, value| puts "#{key} => #{value}" }
end
