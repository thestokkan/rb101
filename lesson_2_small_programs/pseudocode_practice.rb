=begin
1. Method that returns the sum of two integers

Casual:
Given two integers, add the two integers and return the result.


Formal:
START
# Given two integers

SET sum = integer1 + integer2

PRINT sum

END


2. A method that takes an array of strings and returns a string that is all those strings concatenated together.

Casual:
Given an array of strings.
Create an empty string variable

Iterate through the array one element at a time.
  - for each iteration, add/concatenate the current string to the string variable

After iterating through the array, return the sting variable with all the concatenated strings.

Formal:

START

# Given an array of strings

SET new_string = ""
SET iteratorh = 1

WHILE iterator <= length of array
  SET new_string = new_string + vcurrent string

  iterator = iterator + 1

PRINT new_string

# 3. A method that takes an array of integers and returns a new array with every other element.

Casual:
Given an array of integers.

Create an empty array to hold the new values.

Loop through the original array one element at a time
  - For every other iteration, add the current element to the new array

Return the new array.

Formal:

Given an array of integers.

SET new_array = []
SET iterator = 1

WHILE iterator <= length of array
  SET new_array = every other element of array

  iterator = iterator + 1

PRINT new_array

=end
