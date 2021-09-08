# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

puts 'Welcome to Calculator!'

puts "What's the first number?"

number1 = gets.chomp

puts "What's the second number?"

number2 = gets.chomp


puts "Which operation would you like me to perform? 1) add, 2) subtract, 3) multiply, 4) divide"
operator = gets.chomp

result = case operator
        when "1"
          number1.to_f + number2.to_f
        when "2"
          number1.to_f - number2.to_f
        when "3"
          number1.to_f * number2.to_f
        when "4"
          unless number2.to_f == 0
            number1.to_f / number2.to_f
          else
            "Cannot divide by 0, please try again"
          end
        else
          "Invalid input, please try again"
        end

puts result
