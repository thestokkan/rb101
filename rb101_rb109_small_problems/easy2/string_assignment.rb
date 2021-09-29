#
# String Assignment
#
# Take a look at the following code:
#
# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name

# What does this code print out? Think about it for a moment before continuing.
#
# If you said that code printed
#
# Alice
# Bob
#
# you are 100% correct, and the answer should come as no surprise. Now, let's
# look at something a bit different:
#
# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name


name = 'Bob' # name is initialized to reference string literal object 'Bob'
save_name = name # save_name is initialized to reference the same object as name
name = 'Alice' # name is reassigned another object (does not mutate original)
puts name, save_name # output: Alice; Bob


name = 'Bob' # name is initialized to reference string literal object 'Bob'
save_name = name # save_name is initialized to reference the same object as name
name.upcase! # the object name is referencing is mutated through name
puts name, save_name # output: BOB; BOB
