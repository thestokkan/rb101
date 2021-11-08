# Practice Problem 7
#
# Create a hash that expresses the frequency with which each letter occurs in this string:
#
statement = "The Flintstones Rock"
#
# ex:
#
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

puts '---1---'
frequency = statement.chars.each_with_object({}) do |letter, hsh|
  hsh[letter] = statement.count(letter) unless letter == ' '
end

p frequency

puts
puts '---2---'

frequency2 = {}
letters = statement.chars.uniq

letters.each do |letter|
  frequency2[letter] = statement.count(letter)
end

p frequency2

puts
puts '---3---'

frequency3 = statement.chars.tally
p frequency3
