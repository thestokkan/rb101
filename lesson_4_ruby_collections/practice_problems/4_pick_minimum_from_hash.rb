# Practice Problem 4
#
# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts "---1---"
min = ages.values.min
puts min

puts
puts "---2---"

min2 = ages.values[0]

ages.each do |_, age|
  min2 = age if age < min2
end

puts min2

puts
puts "---3---"

min3 = ages.values.sort.shift
puts min3
