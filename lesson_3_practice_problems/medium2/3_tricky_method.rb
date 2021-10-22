# Question 3
#
# Let's call a method, and pass both a string and an array as arguments and see
# how even though they are treated in the same way by Ruby, the results can be
# different.
#
# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" # Reassignment of string
  an_array_param << "rutabaga" # Mutating array
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# My string looks like this now: pumpkins
puts "My array looks like this now: #{my_array}"
# My array looks like this now: ["pumpkins", "rutabaga"]

# Why:
# This code demonstrates that objects in Ruby are passed by reference value,
# that re-assignment does not mutate the original object or change the binding
# of the outer scope variable, and that a mutating method within a method definition
# can change the original object which is then reflected in an outer scope variable.

# Step by step:
# Inside the method definition, the method parameters `a_string_param` and
# `an_array_param` are first assigned the objects pointed to by the outer scope
# variables `my_string` and `my_array`, respectively, which are passed to the
# method as arguments. The parameters are variables scoped to the method
# definition and only receive a copy of the references. They therefore do not
# have access to change the outer scope variables.

# On `line 2`, `a_string_param` is re-assigned the string literal `"rutabaga"`.
# Re-assignment never mutates the original object, and since `a_string_param`
# does not have a connection to `my_string`, `my_string` remains unchanged.
# On `line 3`, the object referenced by `an_array_param` is mutated by appending a
# value to the original array. Since this changes the original object, the
# change is reflected in the outer scope variable `my_array`.
