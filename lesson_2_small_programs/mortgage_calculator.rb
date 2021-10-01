# PE(D)AC

# PROCESSING THE PROBLEM

# input
# - amount: integer (number of dollars)
# - apr (APR): integer (5% -> 5)
# - duration: integer (number of years)

# output
# - monthly_percentage_rate: integer (5% -> 5)
# - payment_periods (loan duration months): integer
# - monthly_payment: float (number of dollars)

# Rules/clarifications/questions:
# - Monthly interest rate is APR / 12
# - If APR = 0, monthly payment is loan amount / payment periods
# - In the monthly_payment calculation, the monthly_rate must be expressed as
#   decimal (e.g. 5% -> 0.05) -> need to convert input for calculations
# - Constraints on input
#   - Loan amount: positive number
#   - Loan duration: Integer between 1 and 30
#   - APR: positive number
# - Extract messages to separate file? -> No, not for now

# EXAMPLES/EDGE CASES
# Loan amount, APR, duration -> Payment periods, monthly rate, monthly payment
# 5000, 5, 20 -> 240, 0.4%, $33.00
# 25000, 6, 15 -> 180, 0.5%, $210.96
# 10000, 2, 8 -> 96, 0.2%, $112.81
# 10000, 0, 8 -> 96, 0.0%, $104.17
# Loan duration outside range (1..30) or not Integer -> error message, try again
# Loan amount and/or APR not Float or Integer -> error message, try again
# Loan amount and/or APR < 0 -> error message, try again

# ALGORITHM
# 1. Define methods
#   - Number validation
#     - Integer validation
#     - Float validation
#     - Positive number
#   - Prompt styling
#   - User input
# 2. Welcome user
# 3. Get user input
#   (loan amount, annual percentage rate, and loan duration in years.)
#   - For each input:
#     - Initiate user input variable
#     - Within a loop, prompt user for input
#     - Convert input to Integer
#     - validate input
#       - for amount and APR: Positive number
#       - for duration: Integer between 1 and 30
#     - exit loop when input is validated, otherwise prompt again
#
# 4. Perform calculations
#   Given amount, duration, and APR:
#   1. Calculate the payment_periods (total number of months)
#     -  duration * 12
#   2. Calculate monthly_percentage_rate
#     - apr / 12
#   3. Calculate monthly_payment
#     - If APR == 0: m = p / n
#     - Otherwise: m = p * (j / (1 - (1 + j)**(-n)))
#       m = monthly payment
#       p = loan amount
#       j = monthly interest rate (as decimal number)
#       n = loan duration in months
#
# 5. Print the user's input and then the following results:
#    monthly interest rate, payment periods, and monthly payments.
#
# 6. Ask if user wants to perform another calculation.
#   - If not, print a 'goodbye' message and exit program

# CODE

# 1. Define constants and methods
DURATION_RANGE = (1..30)
MONTHS_IN_A_YEAR = 12

def pos_integer?(num)
  /^\d*$/.match(num) ? true : false
end

def pos_float?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num) ? true : false
end

def pos_number?(num)
  (pos_integer?(num) || pos_float?(num))
end

def prompt(message)
  puts ">> #{message}"
end

# Get user input (loop until valid)
def user_input(message, input_type = '')
  input = ''
  loop do
    prompt message
    print ">> "
    input = gets.chomp

    if input_type == 'duration'
      valid_input = pos_integer?(input) && DURATION_RANGE.include?(input.to_i)
    else
      valid_input = pos_number?(input)
    end
    break if valid_input
    prompt "Please provide a valid number"
  end
  input
end

# 2. Welcome user
prompt 'Welcome to Mortgage Calculator!'
prompt 'Please provide the following details'

loop do # main loop
  # 3. Get user input
  amount = user_input("Loan amount in dollars: ")
  apr = user_input("Annual percentage rate: ")
  duration = user_input("Loan duration in years (1-30): ", 'duration')

  # 4. Perform calculations
  payment_periods = duration.to_i * MONTHS_IN_A_YEAR
  monthly_rate = apr.to_f / MONTHS_IN_A_YEAR / 100
  amount = amount.to_f
  if apr.to_f == 0
    monthly_payment = amount / payment_periods
  else
    monthly_payment =
      amount * (monthly_rate / (1 - (1 + monthly_rate)**(-payment_periods)))
  end

  # 5. Print results
  puts ">> "
  prompt "Your input"
  prompt "  Loan amount: $#{format('%.2f', amount.to_f)}"
  prompt "  Annual percentage rate: #{format('%.1f', apr.to_f)}%"
  prompt "  Loan duration: #{duration.to_i} years"

  prompt "Your results"
  prompt "  Payment periods: #{payment_periods}"
  prompt "  Monthly interest rate: #{format('%.1f', (monthly_rate * 100))}%"
  prompt "  Monthly payment: $#{format('%.2f', monthly_payment)}"

  # Ask if user wants to do another calculation. If not, exit program.
  puts ">> "
  prompt "Would you like to perform another calculation? (y/n)"
  print ">> "
  answer = gets.chomp.downcase

  break unless ['y', 'yes'].include?(answer)
end

prompt "Thank you for using Mortgage Calculator! Goodbye!"
