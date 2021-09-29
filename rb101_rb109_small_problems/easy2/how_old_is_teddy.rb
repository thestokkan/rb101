#
# How old is Teddy?
#
# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.
#
# Example Output
#
# Teddy is 69 years old!


age = (20..200).to_a.sample

puts "Teddy is #{age} years old!"


# LS solution
age = rand(20..200)

# Further exploration
# Modify this program to ask for a name, and then print the age for that person.
#For an extra challenge, use "Teddy" as the name if no name is entered.

def how_old_is(name)
  age = rand(20..200)
  name = 'Teddy' if name.empty?
  "#{name} is #{age} years old!"
end

puts "Please enter a name:"
name = gets.chomp

puts how_old_is(name)
