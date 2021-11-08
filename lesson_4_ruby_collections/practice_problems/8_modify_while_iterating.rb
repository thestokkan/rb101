# Practice Problem 8
#
# What happens when we modify an array while we are iterating over it? What would be output by this code?
#
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

## Answer:
# The array is updated during the iteration. `each` starts the iteration at
# index 0 and continues to refer to the array indices in turn even if the
# values change.
# In the above case, the value at index 0, `1`,  will first be printed,
# then removed from the array. The iteration will continue with index 1,
# which now refers to `3` and this value will be printed. The value at index 0
# is removed from the array leaving only two values, one at index 0 and one at
# index 1. Since `each` has iterated over both of these indices, the iteration
# stops.

# Output:
# 1
# 3


# What would be output by this code?
#
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

## Answer:
# Similarly to above, `each` will continue to iterate as long as there are 'new'
# indices to iterate over. Since values are removed from the end of the array,
# the first two values will be printed before the iteration stops.

# Output:
# 1
# 2

# TAKEAWAY: Iterators work on the ORIGINAL collection in REAL TIME
