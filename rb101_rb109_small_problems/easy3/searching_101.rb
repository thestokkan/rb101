# Searching 101
#
# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5 numbers.
#
# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
#
#
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

## Answer

# Input: 6 numbers
# Output: Printed message with 6th number and an array with the first 5 numbers

# Clarification
# - Input validation?
#   - Let's assume no
# - Can numbers be float?
#   - Let's assume no

# Data structure: Array to hold input values

# Algorithm

# 1. Create an empty array 'numbers' to hold the input numbers
# 2. Prompt the user for a number
#   - Different prompt each time -> 'positions' array of strings
# 3. Save the number to the 'numbers' array
# 4. Repeat 2. and 3. six times
#   - Use 'positions' array for iteration
# 6. Check if the last number is amongst the first five in the 'numbers' array
# 7. Print message

# Code
numbers = []
ordinals = %w(1st 2nd 3rd 4th 5th last)

ordinals.each do |ord|
  print "==> Enter the #{ord} number: "
  number = gets.chomp.to_i
  numbers << number
end

last_number = numbers.pop
if numbers.include? last_number
  puts "The number #{last_number} appears in #{numbers}"
else
  puts "The number #{last_number} does not appear in #{numbers}"
end
