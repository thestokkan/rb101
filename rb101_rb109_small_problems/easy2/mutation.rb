#
# Mutation
#
# What will the following code print, and why? Don't run the code until you have
# tried to answer.

puts '--- ORIGINAL ---'
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Answer
# Line 7: array1 is initialized to an array containing string objects
# Line 8: array2 is initialized to an empty array
# Line 9: Iterating through array1 one value at a time.
#   For each itearation, the current value is appended to array2.
#   array2 will be mutated because '<<' is a mutating method
#   Also, the mutation is happening inside a block, which means array2 can be
#   accessed even if it was initialized in the outer scope.
#   array2 now references the same values as array1.
#   NOTE: array1 and array2 reference different arrays, but their
#   corresponding items reference the same string objects!
# Line 10: Iterating through array1 one item at a time. For each iteration,
#   the current string object is changed to all upper case if the string starts
#   with 'C' or 'S'. Because the mutating method #upcase! is used, the original
#   object is mutated.
# Line 11: Since the items in array2 reference the same objects as array1, the
#   mutation from line 11 will be reflected in array2. It will therefore
#   output:
#   Moe
#   Larry
#   CURLY
#   SHEMP
#   Harpo
#   CHICO
#   Groucho
#   Zeppo


# Further Exploration
#
# How can this feature of ruby get you in trouble? How can you avoid it?

# Answer:
# It can get you into trouble if you inadvertently mutate an array without
# meaning to. This can be avoided by not using mutating methods.

# Example:
# Let's say we want to have the same values in array1 and array2, but then only
# change the values in array1.
puts
puts '--- EXAMPLE 1: non-mutating change ---'
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
# Copy references from array1 to array2 - they now point to the same objects
# (but different arrays)
array1.each { |value| array2 << value }
puts array1.equal?(array2) # => false
puts array1[2].equal?(array2[2]) # => true

# array1 is re-assigned the return value of calling #map on array1 with a
# block that changes the values (but does not mutate the original object)
array1.map! { |value| value.start_with?('C', 'S') ? value.upcase : value }

p 'array1: ', array1
p 'array2: ', array2

# Check
array1.equal?(array2) # => false
array1[1].equal?(array2[1]) # => true (not changed value)
array1[2].equal?(array2[2]) # => false (changed value)

# NB! Values in array1 that are not changed are still pionting to the same
#   objects as the corresponding values in array2!


# NOTE!
array2 = array1.each { |value| value } # Reference the same array
array1.equal?(array2) # => true

array2 = array1.map { |value| value } # Reference the same objects (not same array)
array1.equal?(array2) # => false
array1[1].equal?(array2[1]) # => true

# #each returns the caller, which in this case is array1. array1 and
#   array2 thus points to the same array.
# #map returns a new array, but that array is populated with copies of the
#   references from array1. array1 and array2 thus points to different arrays,
#   but the corresponding references within each array point to the same objects.


# Other student's solutions
puts
puts "--- Student solution: Object#dup ---"
# found this on the Stack Overflow. I prefer this for the simplicity.
# Object#dup method creates a new instance duplicate.
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
p array2
p array1


puts
puts "--- Student solution: #each_with_index ---"
# one way to bypass the problem above.
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each_with_index { |value, ind| array1[ind] = value.upcase if value.start_with?('C', 'S') }
p array2
p array1
