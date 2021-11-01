#
# Arithmetic Integer
#
# Write a program that prompts the user for two positive integers, and then prints
#  the results of the following operations on those two numbers: addition,
#  subtraction, product, quotient, remainder, and power.
#  Do not worry about validating the input.
#
# Example
#
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

=begin
# Answer

- Input: Two positive integers from user
- Output: Results of operations on the numbers
  addition
  subtraction
  product
  quotient
  remainder
  power

## Data structures
Array to hold the operations

## Algorithm
1. Prompt user for two numbers, one at a time
2. Perform each of the operations on the two numbers
  - loop through array of operations
3. Print the results of each operation

=end


## Code

print "==> Enter the first number: "
n1 = gets.chomp.to_i
print "==> Enter the second number: "
n2 = gets.chomp.to_i

# puts "#{n1} + #{n2} = #{n1 + n2}"
# puts "#{n1} - #{n2} = #{n1 - n2}"
# puts "#{n1} * #{n2} = #{n1 * n2}"
# puts "#{n1} / #{n2} = #{n1 / n2}"
# puts "#{n1} % #{n2} = #{n1 % n2}"
# puts "#{n1} ** #{n2} = #{n1 ** n2}"


operators = [:+, :-, :*, :/, :%, :**]
numbers = [n1, n2]

operators.each do |op|
  puts "#{n1} #{op.to_s} #{n2} = #{numbers.reduce(op)}"
end
