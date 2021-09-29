# Print all even numbers from 1 to 99, inclusive, to the console, with each
# number on a separate line.


puts (1..99).select { |n| n.even? }

1.upto(99).each { |n| puts n if n.even? }

n = 2
while n <= 99
  puts n
  n += 2
end

n = 1
while n <= 99
  puts n if n.even?
  n += 1
end
