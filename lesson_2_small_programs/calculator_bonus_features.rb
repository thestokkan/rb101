require 'yaml'
MESSAGES = YAML.load_file('calc_messages_en.yml')
# puts MESSAGES.inspect

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# BONUS FEATURES
# 1. Better integer validation (done)
# 2. Number validation (done)
# 3. Make case statement more robust (done)
# 4. Extract messages to config file
# 5. Internationalize calculator

# Add prefix to prompt
def prompt(message)
  puts "=> #{message}"
end

# Integer validation (not in use, see Number validation below)
def valid_number?(num)
  num.to_i.to_s == num
end

# Number validation (integer and floats)
#   Tricky edge cases:
#   1. `num.to_f` will return numbers in scientific notation
#   for |1e-5| >= num >+ |1e15|
#   2. `num.to_i` will return `0` for num <= 0.00001
#   3. `num.to_f.to_s == num` will return 'false' for `num = 0`
def number?(num)
  if num.include?('.')
    if num.to_f == 0
      num.to_f.to_s == num
    else
      num.to_f / num.to_f == 1.0
    end
  else
    num.to_i.to_s == num
  end
end

# # Tests
# puts number?('a')
# puts number?('/')
# puts number?('0')
# puts number?('0.0')
# puts number?('100')
# puts number?('-100')
# puts number?('100000000000000000000000000000000000')
# puts number?('100000000000000000000000000000000000.0')
# puts number?('0.000000000000000000000000000000000001')
# puts number?('-0.000000000000000000000000000000000001')

# Convert prompt input back into words
def operation_to_message(op)
  msg =
    case op
    when '1'
      MESSAGES['adding']
    when '2'
      MESSAGES['subtracting']
    when '3'
      MESSAGES['multiplying']
    when '4'
      MESSAGES['dividing']
    end
  # More code can go here...
  msg
end

prompt MESSAGES['welcome']

# Ask for name outside main loop (don't want to ask this every time)
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt MESSAGES['use_valid_name']
  else break
  end
end

prompt MESSAGES['greeting'] + name + '!'

loop do # Main loop
  # Since we created a new scope with the loop block, we need to initialize
  # the variables outside of the block
  number1 = ''
  # Loop until number is valid
  loop do
    prompt MESSAGES['first_number']
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt MESSAGES['not_valid_number']
    end
  end

  number2 = ''
  loop do
    prompt MESSAGES['second_number']
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt MESSAGES['not_valid_number']
    end
  end

  prompt MESSAGES['operator_prompt']
  puts MESSAGES['operator_add']
  puts MESSAGES['operator_subtract']
  puts MESSAGES['operator_multiply']
  puts MESSAGES['operator_divide']

  # Loop until valid operator
  operator = ''
  loop do
    operator = gets.chomp

    if operator == '4' && number2.to_f == 0
      prompt MESSAGES['zero_division_error']
    elsif %w(1 2 3 4).include?(operator)
      break
    else
      prompt MESSAGES['choose_1_to_4']
    end
  end

  # Operator confirmation
  prompt operation_to_message(operator) + MESSAGES['the_two_numbers']

  # Operator validation
  result =
    case operator
    when '1'
      number1.to_f + number2.to_f
    when '2'
      number1.to_f - number2.to_f
    when '3'
      number1.to_f * number2.to_f
    when '4'
      number1.to_f / number2.to_f
    end

  prompt MESSAGES['result_is'] + result.to_s + '!'

  prompt MESSAGES['again']
  answer = gets.chomp
  break unless answer.downcase.start_with?(MESSAGES['affirmative'])
end

prompt MESSAGES['thank_you'] + name + '!' + MESSAGES['bye']
