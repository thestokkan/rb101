# Question 5

# Depending on a method to modify its arguments can be tricky:
puts "Original"
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Whether the above "coincidentally" does what we think we wanted "depends" upon
# what is going on inside the method.
#
# How can we change this code to make the result easier to predict and easier
# for the next programmer to maintain?

## Answer
# 1. Make the method do only one thing: either mutate, print/output, or return
# 2. Name the method appropriately based on what it does:
#   - Mutating method: `change...`, `modify...`, `update...`
#   - Printing method: `display...`, `print...`, `output...`
#   - Returning method: `return...`, `new...`,

# Example 1
puts
puts "Update input"
def update_input(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
update_input(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# Example 2:
puts
puts "New variables"
def new_variables(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param = ["pumpkins", "rutabaga"]
  [a_string_param, an_array_param]
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = new_variables(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Example 3:
puts
puts "Print values"
def print_values(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param = ["pumpkins", "rutabaga"]
  puts "My string looks like this inside the method definition: #{a_string_param}"
  puts "My array looks like this inside the method definition: #{an_array_param}"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
print_values(my_string, my_array)

puts "My string looks like this outside the method definition: #{my_string}"
puts "My array looks like this outside the method definition: #{my_array}"
