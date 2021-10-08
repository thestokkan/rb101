# Assignment
# In this assignment, we'll build a Rock Paper Scissors game. The game flow
# should go like this:
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
# Clear terminal
system("clear") || system("cls")

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

rps = {
  user: { choice: '', score: 0 },
  computer: { choice: '', score: 0 }
}

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

def flash(msg)
  5.times do
    print "\r#{msg}"
    sleep 0.4
    print "\r#{' ' * msg.size}"
    sleep 0.4
  end
  print "\r#{msg}\n\n\n"
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

loop do # Main loop
  user = rps[:user]
  computer = rps[:computer]

  # User choice
  loop do
    puts choice_prompt
    print '>> '
    user[:choice] = gets.chomp
    break if valid_input?(user[:choice])
    prompt "Invalid input..."
  end

  # Computer 'choice'
  computer[:choice] = %w(1 2 3).sample
  # Convert number input to words
  user[:choice] = choice_to_word(user[:choice])
  computer[:choice] = choice_to_word(computer[:choice])

  # Calculate results
  res_msg = "It's a draw!"
  winner = ''
  case rps[:user][:choice]
  when 'ROCK'
    if rps[:computer][:choice] == 'PAPER'
      winner = rps[:computer]
      res_msg = 'PAPER beats ROCK!'
    elsif rps[:computer][:choice] == 'SCISSORS'
      winner = rps[:user]
      res_msg = 'ROCK beats SCISSORS!'
    end
  when 'PAPER'
    if rps[:computer][:choice] == 'SCISSORS'
      winner = rps[:computer]
      res_msg = 'SCISSORS beat PAPER!'
    elsif rps[:computer][:choice] == 'ROCK'
      winner = rps[:user]
      res_msg = 'PAPER beats ROCK!'
    end
  when 'SCISSORS'
    if rps[:computer][:choice] == 'ROCK'
      winner = rps[:computer]
      res_msg = 'ROCK beats SCISSORS!'
    elsif rps[:computer][:choice] == 'PAPER'
      winner = rps[:user]
      res_msg = 'SCISSORS beat PAPER!'
    end
  end

  winner[:score] += 1 unless winner.empty?
  results = { winner: rps.key(winner).to_s, message: res_msg }

  # Print results
  puts '', "RESULTS".center(LINE_LENGTH)
  print name
  puts 'Computer'.rjust(LINE_LENGTH - name.length)
  puts LINE
  print user[:choice]
  puts computer[:choice].rjust(LINE_LENGTH - user[:choice].length), "\n\n"

  if results[:winner] == 'user'
    puts results[:message].center(LINE_LENGTH)
    msg = ">>> YOU WIN! <<<".center(LINE_LENGTH)
  elsif results[:winner] == 'computer'
    puts results[:message].center(LINE_LENGTH)
    msg = "YOU LOSE".center(LINE_LENGTH)
  else
    msg = results[:message].center(30)
  end

  flash(msg)

  puts 'SCORE'.center(LINE_LENGTH)
  print name
  puts 'Computer'.rjust(LINE_LENGTH - name.length)
  puts LINE
  print user[:score]
  puts computer[:score].to_s.rjust(LINE_LENGTH - user[:score].to_s.length)
  puts LINE, ''

  # Prompt for another game
  prompt "Want to have another go? (y/n)"
  print ">> "
  answer = gets.chomp.downcase

  break unless ['y', 'yes'].include?(answer)
end

puts '', LINE
puts "Thanks for playing, #{name}!".center(LINE_LENGTH)
puts LINE
