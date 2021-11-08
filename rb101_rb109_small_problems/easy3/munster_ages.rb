# Practice Problem 2
#
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }


puts "---1---"

sum = ages.values.sum
puts sum

puts
puts "---2---"

sum2 = ages.values.reduce(:+)
puts sum2

puts
puts "---3---"

sum3 = ages.map { |name, age| age }.sum
puts sum3

puts
puts "---4---"

sum4 = 0

ages.each { |_, age| sum4 += age }
puts sum4
