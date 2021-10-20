n1 = 10
n2 = n1
switch = true

puts "n1  n2"
loop do
  break if n1 <= 0 || n2 <= 0
  puts "#{n1}  #{n2}"
  switch = (n1 - n2).abs >= 1 ? !switch : switch
  switch ? n1 -= 1 : n2 -= 1
end
