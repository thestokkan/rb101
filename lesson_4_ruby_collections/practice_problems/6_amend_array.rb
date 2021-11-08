# Practice Problem 6
#
# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts '---1---'
p flintstones.map { |name| name[0..2] }

puts
puts '---2---'
p flintstones.map { |name| name.chars.first(3).join }

puts
puts '---3---'
p flintstones.map { |name| name.chars.take(3).join }

puts
puts '---2---'
p flintstones.map { |name| name[0,3] }
