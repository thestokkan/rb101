# Double numbers with odd indices.
# Return new array.

def double_at_odd_indices(arr)
  odd_doubled = []
  i = 0

  loop do
    break if i >= arr.length

    current_value = arr[i]
    current_value *= 2 if i % 2 == 1
    odd_doubled << current_value

    i += 1
  end

  odd_doubled
end


my_arr = [1, 2, 3, 4, 5, 6]
p double_at_odd_indices(my_arr)
p my_arr

# Test cases
p double_at_odd_indices([1, 2, 3, 4, 5]) == [1, 4, 3, 8, 5]
p double_at_odd_indices([]) == []
p double_at_odd_indices([0, 1, 2, 3, 4, 5, 6]) == [0, 2, 2, 6, 4, 10, 6]



# Multiply every odd item by any number
def muliply_odd(arr, n)
  multiplied = []
  i = 0

  loop do
    break if i >= arr.length

    current_value = arr[i]
    current_value *= n if i % 2 == 1
    multiplied << current_value

    i += 1
  end

  multiplied
end


my_arr = [1, 2, 3, 4, 5, 6]
p muliply_odd(my_arr, 3)
p my_arr

# Multiply every item by any number
def multiply(arr, n)
  multiplied = []
  i = 0

  loop do
    break if i >= arr.length

    multiplied << arr[i] * n

    i += 1
  end

  multiplied
end


my_arr = [1, 2, 3, 4, 5, 6]
p multiply(my_arr, 3)
p my_arr
