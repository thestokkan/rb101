# Practice Problem 1
#
# Given the array below
#
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
#
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

puts "1"
hash = flintstones.each_with_object({}).with_index do |(name, hsh), i|
  hsh[name] = i
end

p hash

puts
puts "2"

hash2 = {}
flintstones.each_with_index do |name, i|
  hash2[name] = i
end

p hash2

puts
puts "3"

hash3 = {}
i = 0

loop do
  break if i >= flintstones.size
  hash3[flintstones[i]] = i
  i += 1
end

p hash3

puts
puts "4"

hash4 = {}
i = 0

while i < flintstones.size
  hash4[flintstones[i]] = i
  i += 1
end

p hash4
