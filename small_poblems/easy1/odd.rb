=begin
Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

Examples:

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

Keep in mind that you're not allowed to use #odd? or #even? in your solution.

=end

# input: valid integer
# output: boolean true/false
  # true if absolute value of integer is odd
  # false if abs value is not odd

# note: do not use #odd or #even methods

puts "With \#% operator:"

def is_odd?(number)
    number % 2 == 1
end

# test
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true


# Further Exploration
# If you weren't certain whether % were the modulo or remainder operator, how would you rewrite #is_odd? so it worked regardless?

puts "With \#remainder operator:"

def is_odd2?(number)
    puts number.abs.remainder(2) == 1
end

# test
puts is_odd2?(2)    # => false
puts is_odd2?(5)    # => true
puts is_odd2?(-17)  # => true
puts is_odd2?(-8)   # => false
puts is_odd2?(0)    # => false
puts is_odd2?(7)    # => true
