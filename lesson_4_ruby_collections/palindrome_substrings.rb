# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

## Answer
# PEDAC
#
# UNDERSTAND THE PROBLEM
# - Clarifications
#   - What if the input string has multiple words?
#     - Treat the same as single word (would ask)
#   - Can I assume the input is a string?
#     - Assume yes (would ask)
#   - Can letters appear in more than one palindrome?
#     - Yes, see test cases
#   - What is considered a substring?
#     - Any combination of two or more subsequent letters in the input string
#
# - Input: string
# - Output: array of strings
# - Requirements
#   - Explicit
#     - Palindromes are case sensitive
#   - Implicit
#     - Empty string -> empty array
#     - No palindromes -> empty array
#     - The same letters can appear in more than one palindrome -> treat each
#       palindrome as a new string to be checked)
#
# EXAMPLES/EDGE CASES
# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []
#
# Example substrings
# hello -> he, hel, hell, hello,
#          el, ell, ello,
#          ll, llo,
#          lo
# abcddcbA -> ab, abc, abcd, abcdd, abcddc, abcddcb, abcddcbA
#             bc, bcd, bcdd, bcddc, bcddcb, bcddcbA,
#             cd, cdd, cddc, cddcb, cddcbA,
#             dd, ddc, ddcb, ddcbA,
#             dc, dcb, dcbA,
#             cb, cA
# ALGORITHM
# 1. Create helper method to extract all substrings into an array
# - Nested loops:
#   First loop iterates through the string indices from 0 to next to last
#   index (string length - 2).
#     Second (nested) loop iterates from 2 to string length minus the value
#     of the outer loop index.
#     - 
# 2. Create helper method to check if string is a palindrome
# - check if the string reversed is equal to string
# 3. Main method
# - Initialize an array to hold the resulting palindromes (if any)
# - Initialize array of substrings using helper method
# - Loop through array of substrings
# - If substring is a palindrome, add it to the results array
# - When loop is done, return results array
#
# CODE

def substrings(str)
  substrings = []
  i = 0
  while i < str.size - 2
    j = 2
    while j <= str.size - i
      substrings << str[i,j]
      j += 1
    end
    i += 1
  end
  substrings
end

def is_palindrome?(str)
  str.reverse == str
end


def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
