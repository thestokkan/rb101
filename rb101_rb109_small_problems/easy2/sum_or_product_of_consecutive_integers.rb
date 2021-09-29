#
# Sum or Product of Consecutive Integers
#
# Write a program that asks the user to enter an integer greater than 0, then asks
# if the user wants to determine the sum or product of all numbers between 1 and
# the entered integer.
#
# Examples:
#
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.
#
#
# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.


# Without validation
print '>> Please enter an integer greater than 0: '
number = gets.chomp.to_i

print ">> Enter 's' to compute the sum, 'p' to compute the product. "
operation = gets.chomp.downcase


if operation == 's'
  # compute the sum of integers between 1 and number
  sum = (1..number).sum
  puts "The sum of integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  # compute product of integers between 1 and number.
  product = (1..number).reduce(:*)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Please enter 's' or 'p'."
end
