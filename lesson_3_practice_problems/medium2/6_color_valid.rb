# Question 6

# How could the following method be simplified without changing its return value?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

puts "Original:"
puts color_valid('green')
puts color_valid('blue')
puts color_valid('red')

## Answer

def color_valid2(color)
  color == "blue" || color == "green"
end

puts
puts "Modified:"
puts color_valid2('green')
puts color_valid2('blue')
puts color_valid2('red')
