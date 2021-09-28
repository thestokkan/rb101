#
# Sum of Digits
#
# Write a method that takes one argument, a positive integer, and returns the sum of its digits.
#
# Examples:
#
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45
#
# The tests above should print true.
#
# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).


# 'PEDA'
# Need to split number into its separate digits and then sum the digits.

# 1. Convert number to string.
# 2. Split string into separate characters.
# 3. Store characters as separate elements in an array.
# 4. Convert characters back to integers
# 5. Sum the integer digits
# 6. Return sum


def sum(num)
  num.to_s.chars.map(&:to_i).sum
end

# Tests
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# Using `digits` method
def sum(num)
  num.digits.sum
end

# Tests
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
