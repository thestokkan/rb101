#
# Reverse It (Part 1)
#
# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.
#
# Examples:
#
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''
#
# The tests above should print true.

# ANSWER
# Split the string into words and save them in an array
# Place the words from the first array into a second array last to first
# Concatenate the words in the second array into a string
# Return the final (reversed) string

# Note
# - Don't need to call `puts` within the method def (see examples)

# Solution without using Array#reverse:

def reverse_sentence(sentence)
  s_array = sentence.split
  r_array = []
  s_array.length.times do
    r_array << s_array.pop
  end
  r_array.join(' ')
end

# Tests
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''


# LS SOLUTION (with #reverse)
def reverse_sentence(string)
  string.split.reverse.join(' ')
end
