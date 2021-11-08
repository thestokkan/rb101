# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

puts '---1---'
idx = flintstones.index { |name| name.include? "Be" }

puts idx

puts
puts '---2---'
idx2 = flintstones.index { |name| /^Be/ === name }

puts idx2

puts
puts '---3---'


idx3 = nil
flintstones.each_with_index do |name, i|
  idx3 = i if name.start_with? "Be"
end
puts idx3


puts
puts '---4---'
idx4 = flintstones.index { |name| name[0, 2] == "Be" }
puts idx4
