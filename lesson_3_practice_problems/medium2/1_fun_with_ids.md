# Question 1

Every named entity in Ruby has an object_id. This is a unique identifier for that object.

It is often the case that two different things "look the same", but they can be different objects.
The "under the hood" object referred to by a particular named-variable can change depending on what is done to that named-variable.

In other words, in Ruby, all values are objects...but they are not always the same object.

Predict how the values and object ids will change throughout the flow of the code below:

```ruby
def fun_with_ids
  a_outer = 42 # points to Integer
  b_outer = "forty two" # points to String literal
  c_outer = [42] # points to Array object
  d_outer = c_outer[0] # points to element with index 0 in c_outer, which is the same Integer referenced by a_outer

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  puts

  1.times
  # The block creates a new inner scope in which it has access to the outer scope variables.
    a_outer_inner_id = a_outer.object_id # Same object_id as outer
    b_outer_inner_id = b_outer.object_id # Same object_id as outer
    c_outer_inner_id = c_outer.object_id # Same object_id as outer
    d_outer_inner_id = d_outer.object_id # Same object_id as outer

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    puts

    # Reassignment within the block will change the references of the outer scope variables
    a_outer = 22 # Reassignment to new Integer -> new id
    b_outer = "thirty three" # Reassignment to new String literal -> new id
    c_outer = [44] # Reassignment to new Array -> new id
    d_outer = c_outer[0] # Reassignment to new Integer -> new id (no longer same as a_outer)

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts

    # Initialization of x_inner variables - not accessible in outer scope!
    a_inner = a_outer # Points to same object as a_outer -> same obj id
    b_inner = b_outer # Points to same object as b_outer -> same obj id
    c_inner = c_outer # Points to same object as c_outer -> same obj id
    d_inner = c_inner[0] # Points to same object as d_outer -> same obj id

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  puts

  # x_inner variables were initialized in the inner scope of the block and are therefore not accessible in the outer scope.
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end
```

## Answer
Also see comments in the code above.

Expected output (without running code, object ids are checked for each object):

a_outer is 42 with an id of: 85 before the block.
b_outer is forty two with an id of: 60 before the block.
c_outer is [42] with an id of: 80 before the block.
d_outer is 42 with an id of: 85 before the block.

a_outer id was 85 before the block and is: 85 inside the block.
b_outer id was 60 before the block and is: 60 inside the block.
c_outer id was 80 before the block and is: 80 inside the block.
d_outer id was 85 before the block and is: 85 inside the block.

a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 60 before and: 100 after.
c_outer inside after reassignment is [44] with an id of: 80 before and: 120 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.

a_inner is 22 with an id of: 45 inside the block (compared to 45 for outer).
b_inner is thirty three with an id of: 100 inside the block (compared to 100 for outer).
c_inner is [44] with an id of: 120 inside the block (compared to 120 for outer).
d_inner is 44 with an id of: 89 inside the block (compared to 89 for outer).

a_outer is 22 with an id of: 85 BEFORE and: 45 AFTER the block.
b_outer is thirty three with an id of: 60 BEFORE and: 100 AFTER the block.
c_outer is [44] with an id of: 80 BEFORE and: 120 AFTER the block.
d_outer is 44 with an id of: 85 BEFORE and: 89 AFTER the block.

ugh ohhhhh
ugh ohhhhh
ugh ohhhhh
ugh ohhhhh
