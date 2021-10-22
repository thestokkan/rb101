# Question 4

# To drive that last one home...let's turn the tables and have the string show
# a modified output, while the array thwarts the method's efforts to modify the
# caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga' # Mutating the string
  an_array_param = ['pumpkins', 'rutabaga'] # Re-assigning a new array
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# My string looks like this now: pumpkinsrutabaga
puts "My array looks like this now: #{my_array}"
# My array looks like this now: ["pumpkins"]


## Answer
# Now the string object is mutated on `line 2` while the metod parameter is
# re-assigned a new array object on `line 3`. The result is therefore the opposite
# of the last exercise. See `tricky_method.rb` for detailed explanation. 
