#
# When will I Retire?
#
# Build a program that displays when the user will retire and how many years she
# has to work till retirement.
#
# Example:
#
# What is your age? 30
# At what age would you like to retire? 70
#
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!


# 1. get input: age, retirement_age
# 2. Save current_year in a constant variable
# 3. Calculate retirement_year and years_until_retirement
# 4. Output results


current_year = Time.now.year

print 'What is your age? '
age = gets.to_i

print 'At what age would you like to retire? '
retirement_age = gets.to_i


retirement_year = current_year + retirement_age - age

years_until_retirement = retirement_year - current_year

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You only have #{years_until_retirement} years left of work to go!"
