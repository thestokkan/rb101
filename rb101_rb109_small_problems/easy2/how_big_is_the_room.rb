#
# How big is the room?
#
# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.
#
# Note: 1 square meter == 10.7639 square feet
#
# Do not worry about validating the input at this time.
#
# Example Run
#
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# PEDA
# input: two numbers (length and width in meters)
# output: float (area in square meters and square feet)
# rules:
# - don't validate numbers
# - 1 m2 == 10.7639 square feet
# questions: input as float or integer? -> float

# Algorithm
# Prompt the user for two numbers: the length and width of a room in meters.
# Use the input to calculate the area in square meters.
# Convert the area to square feet using the relationship: 1 m2 == 10.7639 sq.f.
# Display the results of both calculations.

# Code

SQMETERS_TO_SQFEET = 10.7639

puts 'Enter the length of the room in meters:'
length = gets.chomp.to_f

puts 'Enter the width of the room in meters:'
width = gets.chomp.to_f

area_meters = length * width
area_feet = area_meters * SQMETERS_TO_SQFEET

puts "The area of the room is #{area_meters.round(2)} square meters \
(#{area_feet.round(2)} square feet)."

# Further Exploration
#
# Modify this program to ask for the input measurements in feet,
# and display the results in square feet, square inches, and square centimeters.

SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCM = 929.0304

puts 'Enter the length of the room in feet:'
length_f = gets.chomp.to_f

puts 'Enter the width of the room in feet:'
width_f = gets.chomp.to_f

area_feet = length_f * width_f
area_inches = area_feet * SQFEET_TO_SQINCHES
area_cm = area_feet * SQFEET_TO_SQCM

puts "The area of the room is #{area_feet.round(2)} square feet \
(#{area_inches.round(2)} square inches, #{area_cm.round(2)} square cm)."
