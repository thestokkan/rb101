# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"


## Answer
# Rules
# - Change words that are palindromes to uppercase
# - Don't change the original string
# - Implicit (from test cases):
#   - Words that are already uppercase are left as is
#   - Empty string in -> empty string out

# Clarifications
# - Validate input?

# Algorithm
# 1. Split the string into words
# 2. Loop through words
#   - if word is palindrome, change to uppercase
#   - if not palindrome, leave as is
# 3. Return string with uppercase palindromes

# Code

def change_me(string)
  words = string.split
  changed_words = words.map do |word|
    word.reverse == word ? word.upcase : word
  end
  changed_words.join(' ')
end

puts change_me("We will meet at noon")

# Test code
puts change_me("We will meet at noon") == "We will meet at NOON"
puts change_me("No palindromes here") == "No palindromes here"
puts change_me("") == ""
puts change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"
