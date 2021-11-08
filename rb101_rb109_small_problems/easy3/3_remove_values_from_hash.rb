# Practice Problem 3
#
# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

puts "---1---"
ages.reject! { |_, age| age >= 100 }

p ages

puts
puts "---2---"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! { |_, age| age < 100 }
p ages

puts
puts "---3---"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |_, age| age >= 100 }
p ages

puts
puts "---4---"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if { |_, age| age < 100 }
p ages

puts
puts "---5---"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.filter! { |_, age| age < 100 }
p ages
