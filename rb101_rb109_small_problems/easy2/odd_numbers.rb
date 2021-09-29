#
# Odd Numbers
#
# Print all odd numbers from 1 to 99, inclusive, to the console, with each number
# on a separate line.


# 1. Create a range of numbers from 1 to 99, inclusive
# 2. iterate through the range and select odd numbers
# 3. print each number on a separate line


# Initial solution
puts (1..99).select { |n| n % 2 == 1 }


# Further Exploration
#
# Repeat this exercise with a technique different from the one you just used,
# and different from the solution shown above. You may want to explore the use
# Integer#upto or Array#select methods, or maybe use Integer#odd?

puts (1..99).select { |n| n.odd? }

1.upto(99).each { |n| puts n if n.odd? }
