# Assignment
# In this assignment, we'll build a Rock Paper Scissors game. The game flow should go like this:
#
#     the user makes a choice
#     the computer makes a choice
#     the winner is displayed

# PEDAC

# UNDERSTAND THE PROBLEM
# - Input: user choice, computer choice
# - Output: winner (user or computer)
# - Requirements
#   - Rules of the game: Each chooses rock, paper or scissors. Rock beats
#     scissors, paper beats rock, and scissors beats paper. Equal choices
#     means it's a draw.
#   - The computer chooses at random
# - Clarifications/notes
#   - Prompt user for another game after each round
#   - Validate input (integer between 1 and 3)
#   - Need to keep track of who made which choice as well as decide the winner
#     based on both choices.
#   - Don't keep score (for now)

# EXAMPLES/EDGE CASES
# 1) rock, 2) paper), 3) scissors
# User: 1; Computer: 3; Output: "Rock beats scissors => The user wins!"
# User: 2; Computer: 3; Output: "Scissors beats paper => The computer wins!"
# User: 1; Computer: 1; Output: "Both chose rock => It's a draw!"
# User: potato => Output: "Inavlid input, try again."
# User: 4 => Output: "Inavlid input, please choose 1, 2 or 3"
# User: one => Output: "Inavlid input,  please choose 1, 2 or 3."

# DATA STRUCTURE
# Use hash to store players keys and choices as values

# ALGORITHM
# Extract logic to methods
#   - Custom prompt
#   - Input validation
#   - Convert number input to choice
#     - 1 = 'rock'
#     - 2 = 'paper'
#     - 3 = 'scissors'
#   - Winner
#     - Input: hash with players (keys) and their respective choices (values)
#     - Output: Winner
#     - Rules of the game
#       - rock beats scissors
#       - paper beats rock
#       - scissors beats paper
#       - Equal choice means draw
#     - Compare choices (hash values) based on rules and return winner (key)
# Welcome user to game and prompt for name
# Within a loop
#   1. Initialize variable to hold user's choice
#   Within a loop
#     Prompt user for input
#     Validate input
#     If input is valid, quit loop.
#     If input is not valid, display error message
#   2. Computer makes a random choice
#   3. Apply rules to user and computer choices
#   4. Display personalized result
#   5. Prompt user for another game
#     If yes => continue loop
#     If no => quit loop
# Print personalized 'goodbye' message

# CODE
def prompt(message)
  puts ">> #{message}"
end

choice_prompt = <<-MSG
>> Make your choice (1-3):
>>  1) rock
>>  2) paper
>>  3) scissors
  MSG

def integer?(num)
  /^-?\d*$/.match(num) ? true : false
end

def valid_input?(input)
  integer?(input) && (1..3).include?(input.to_i)
end

# Choice translation
def choice_to_word(input)
  choice_word = case input
              when '1'
                'ROCK'
              when '2'
                'PAPER'
              when '3'
                'SCISSORS'
              end
  choice_word
end


def winner(choices)
  # Placeholder code
  choices.keys.sample
end

prompt "Welcome to Rock, paper, scissors!"

name = ''
loop do
    prompt 'Please enter your name:'
    print '>> '
    name = gets.chomp
  break unless name.empty?
end

LINE_LENGTH = name.length + 30
LINE = '-' * LINE_LENGTH

puts '', LINE
puts ">>>>> Let's play, #{name}! <<<<<".center(LINE_LENGTH)
puts LINE, ''

loop do # main loop
  choices = {user: '', computer: ''}

  # User choice
  loop do
    puts choice_prompt
    print '>> '
    choices[:user] = gets.chomp
    break if valid_input?(choices[:user])
    prompt "Invalid input..."
  end

  # Computer 'choice'
  choices[:computer] = %w(1 2 3).sample
  choice_user = choice_to_word(choices[:user])
  choice_computer = choice_to_word(choices[:computer])

  # Print results
  puts ''
  puts 'RESULTS'.center(LINE_LENGTH)
  print name
  puts 'Computer'.rjust(LINE_LENGTH - name.length)
  puts LINE
  print choice_user
  puts choice_computer.rjust(LINE_LENGTH - choice_user.length)
  puts LINE

  winner = winner(choices)

  if winner == :user
    prompt "Congratulations, you won!"
  elsif winner == :computer
    prompt "Sorry, you were outsmarted by a computer."
  else
    prompt "It's a draw!"
  end

  # Prompt for another game
  puts ">>"
  prompt "Want to have another go? (y/n)"
  print ">> "
  answer = gets.chomp.downcase

  break unless ['y', 'yes'].include?(answer)
end

puts '', LINE
puts "Thanks for playing, #{name}!".center(LINE_LENGTH)
puts LINE
