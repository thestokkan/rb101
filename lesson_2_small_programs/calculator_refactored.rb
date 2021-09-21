# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# Add prefix to prompt
def prompt(message)
  puts "=> #{message}"
end

# Number validation
# 'string'.to_i => 0 (This also stops '0' as input, but we'll deal
# with that later)
def valid_number?(num)
  num.to_i != 0
end

# Convert prompt input back into words
def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt 'Welcome to Calculator! Enter your name:'

# Ask for name outside main loop (don't want to ask this every time)
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure to use a valid name"
  else break
  end
end

prompt "Hi #{name}!"

loop do # Main loop
  # Since we created a new scope with the loop block, we need to initialize
  # the variables outside of the block
  number1 = ''
  # Loop until number is valid
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt "That's not a valid number, try again."
    end
  end

  number2 = ''
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt "That's not a valid number, try again."
    end
  end

  # Write multiline strings
  operator_prompt = <<-MSG # three arbitrary letters as delimeters, must match
    Which operation would you like me to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
    MSG

  prompt operator_prompt

  # Loop until valid operator
  operator = ''
  loop do
    operator = gets.chomp
    binding.pry
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "Must choose 1, 2, 3, or 4."
    end
  end

  # Operator confirmation

  prompt "#{operation_to_message(operator)} the two numbers..."

  # Use case statement instead of if/else (I already did this)
  result =
    case operator
    when '1'
      number1.to_f + number2.to_f
    when '2'
      number1.to_f - number2.to_f
    when '3'
      number1.to_f * number2.to_f
    when '4'
      if number2.to_f == 0
        "Cannot divide by 0, please try again"
      else
        number1.to_f / number2.to_f
      end
    else
      "Invalid input, please try again"
    end

  prompt "The result is #{result}!"

  prompt "Do you want to perform another calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for using the calculator, #{name}. Good bye!"
