# Question 2

Let's look at object id's again from the perspective of a method call instead of a method call.

Here we haven't changed ANY of the code outside or inside of the method call/method. We simply took the contents of the method call from the previous practice problem and moved it to a method, to which we are passing all of our outer variables.

Predict how the values and object ids will change throughout the flow of the code below:

```ruby
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the method call."
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end
```


## Answer
Since what is passed to the method are copies of the references, the reassignment of the variables is
not reflected outside of the method definition. Therefore, the variables x_outer and x_outer_id
are the same in the outer scope after the method call. Otherwise the output is the same: x_inner is not accessible
in the outer scope so the rescue text will be printed. The print statements within the method definition
will output the same as from within the block.

Expected output (without running code, object ids are checked for each object):

1. Initialize x_outer variables and x_outer_id (same as previous)
a_outer is 42 with an id of: 85 before the method call.
b_outer is forty two with an id of: 60 before the method call.
c_outer is [42] with an id of: 80 before the method call.
d_outer is 42 with an id of: 85 before the method call.

2. Inside method definition (same as within the block)

a_outer id was 85 before the method call and is: 85 inside the method.
b_outer id was 60 before the method call and is: 60 inside the method.
c_outer id was 80 before the method call and is: 80 inside the method.
d_outer id was 85 before the method call and is: 85 inside the method.

a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 60 before and: 100 after.
c_outer inside after reassignment is [44] with an id of: 80 before and: 120 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.

a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer).
b_inner is thirty three with an id of: 100 inside the method (compared to 100 for outer).
c_inner is [44] with an id of: 120 inside the method (compared to 120 for outer).
d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer).


3. Call method containing code previously in method call, pass in all outer variables as arguments.
Variables x_outer and x_outer_id do not change:

a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
b_outer is forty two with an id of: 60 BEFORE and: 60 AFTER the method call.
c_outer is [42] with an id of: 80 BEFORE and: 80 AFTER the method call.
d_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.

ugh ohhhhh
ugh ohhhhh
ugh ohhhhh
ugh ohhhhh
