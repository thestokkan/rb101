#
# Reverse It (Part 2)
#
# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.
#
# Examples:
#
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# ANSWER
# P
# - Input: String with one or more words
#  - Only letters and spaces
# - Output: String where the letters of words with 5 or more letters are reversed
#  - Include spaces when more than one word
# Notes
# - Keep words in original order
# - Words with fewer than 5 letters are kept as is

# E
# See provided examples

# D
# Input: String
# Intermediate: Array
# Output: String

# A
# For a given string.
# 1. Save a list of the words in the string.
# 2. Loop through the list one word at a time.
# 3. For each word, if number of characters is five or greater: reverse its characters
# 4. Save all words to a new array
# 5. Combine the words in the new array to a string (separate words by spaces)
# 6. Return the string


def reverse_words(string)
  reversed = string.split.map do |word|
    word.reverse! if word.length >= 5
    word
  end
  reversed.join(' ')
end


# Tests
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
