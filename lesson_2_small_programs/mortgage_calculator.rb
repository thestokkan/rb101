# You'll need three pieces of information:
#
#     the loan amount
#     the Annual Percentage Rate (APR)
#     the loan duration
#
# From the above, you'll need to calculate the following things:
#
#     monthly interest rate
#     loan duration in months
#     monthly payment
#
# You can use the following formula:
# m = p * (j / (1 - (1 + j)**(-n)))
#
#
#     m = monthly payment
#     p = loan amount
#     j = monthly interest rate
#     n = loan duration in months
#
# When you write your program, don't use the single-letter variables m, p, j, and n; use explicit names. For instance, you may want to use amount instead of p.
#
# Finally, don't forget to run your code through Rubocop.
#
# Hints:
#
#     Figure out what format your inputs need to be in. For example, should the interest rate be expressed as 5 or .05, if you mean 5% interest?
#     If you're working with Annual Percentage Rate (APR), you'll need to convert that to a monthly interest rate.
#     Be careful about the loan duration -- are you working with months or years? Choose variable names carefully to assist in remembering.
#     You can use this loan calculator to check your results.

# PEDA
# Processing the problem

# input
# - amount: integer (number of dollars)
# - annual_percentage_rate (APR): integer (5% -> 5)
# - loan_duration_years: integer (number of years)

# output
# - monthly_percentage_rate: integer (5% -> 5)
# - payment_periods (loan duration months): integer
# - monthly_payment: float (number of dollars)

# Examples/edge cases
# amount = 25000
# annual_percentage_rate = 5
# loan_duration_years = 30
# => monthly_percentage_rate =
# => payment_periods = 360
# => monthly_payment = 134.21

# Constraints on loan duration and/or interest rate? -> NO
# Allow loan_duration_years entered as float? -> NO, only full years (for now)

# Algorithm
# Given amount, loan_duration_years, and annual_percentage_rate:
# 1. Calculate the total number of payments (payment_periods)
#   -  loan_duration_years * 12
# 2. Calculate monthly_percentage_rate
#   - annual_percentage_rate / 12
# 3. Calculate monthly_payment
#   - see above
# Print the above results


def mortgage_calc(amount, annual_percentage_rate, loan_duration_years)
  payment_periods = loan_duration_years * 12
  monthly_percentage_rate = annual_percentage_rate.to_f / 12
  monthly_payment = amount.to_f *
                    (monthly_percentage_rate /
                    (1 - (1 + monthly_percentage_rate)**(-payment_periods)))

  puts "Payment periods: #{payment_periods}"
  puts "Monthly interest rate: #{monthly_percentage_rate.round(2)}%"
  puts "Monthly payment: $#{monthly_payment.round(2)}"
end


mortgage_calc(5000, 5, 20)
