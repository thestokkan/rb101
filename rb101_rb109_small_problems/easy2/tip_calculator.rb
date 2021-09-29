#
# Tip calculator
#
# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the tip
# and the total amount of the bill.
#
# Example:
#
# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0


# 1. prompt for input: bill amount and tip
# 2. calculate tip and total amount
# 3. Display result

print 'What is the bill? '
bill = gets.to_f

print 'What is the tip percentage? '
tip_percentage = gets.to_f

tip = bill * tip_percentage / 100
total = bill + tip

puts "The tip is $#{tip.round(2)}"
puts "The total is $#{total.round(2)}"


# Further Exploration

# Our solution prints the results as $30.0 and $230.0 instead of the more usual
# $30.00 and $230.00. Modify your solution so it always prints the results with
# 2 decimal places.

puts "The tip is $" + sprintf("%.2f", tip)
puts "The total is $" + sprintf("%.2f", total)
