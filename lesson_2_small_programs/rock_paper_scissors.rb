require 'pry'
# Assignment
# In this assignment, we'll build a ROCK PAPER SCISSORS game. The game flow
# should go like this:
#
#     the player makes a move
#     the computer makes a move
#     the winner is displayed

# PEDAC

# UNDERSTAND THE PROBLEM
# - Input: player move, computer move
# - Output: winner (player or computer)
# - Requirements
#   - Rules of the game: Each chooses ROCK, PAPER or SCISSORS. ROCK beats
#     SCISSORS, PAPER beats ROCK, and SCISSORS beats PAPER. Equal moves
#     means it's a draw.
#   - The computer chooses at random
# - Clarifications/notes
#   - Prompt player for another game after each round
#   - Validate input (integer between 1 and 3)
#   - Need to keep track of who made which move as well as decide the winner
#     based on both moves.
#   - Don't keep score (for now)

# EXAMPLES/EDGE CASES
# 1) ROCK, 2) PAPER), 3) SCISSORS
# player: 1; Computer: 3; Output: "ROCK beats SCISSORS => The player wins!"
# player: 2; Computer: 3; Output: "SCISSORS beats PAPER => The computer wins!"
# player: 1; Computer: 1; Output: "Both chose ROCK => It's a draw!"
# player: potato => Output: "Inavlid input, try again."
# player: 4 => Output: "Inavlid input, please choose 1, 2 or 3"
# player: one => Output: "Inavlid input,  please choose 1, 2 or 3."

# DATA STRUCTURE
# Use hash to store players keys and moves as values

# ALGORITHM
# Extract logic to methods
#   - Custom prompt
#   - Input validation
#   - Convert number input to move
#     - 1 = 'ROCK'
#     - 2 = 'PAPER'
#     - 3 = 'SCISSORS'
#   - Winner
#     - Input: hash with players (keys) and their respective moves (values)
#     - Output: Winner
#     - Rules of the game
#       - ROCK beats SCISSORS
#       - PAPER beats ROCK
#       - SCISSORS beats PAPER
#       - Equal move means draw
#     - Compare moves (hash values) based on rules and return winner (key)
# Welcome player to game and prompt for name
# Within a loop
#   1. Initialize variable to hold player's move
#   Within a loop
#     Prompt player for input
#     Validate input
#     If input is valid, quit loop.
#     If input is not valid, display error message
#   2. Computer makes a random move
#   3. Apply rules to player and computer moves
#   4. Display personalized result
#   5. Prompt player for another game
#     If yes => continue loop
#     If no => quit loop
# Print personalized 'goodbye' message

# CODE
# Clear terminal
system("clear") || system("cls")

def prompt(message)
  puts ">> #{message}"
end

move_prompt = <<-MSG
>> Make your move (1-5):
>>  1) Rock
>>  2) Paper
>>  3) Scissors
>>  4) Lizard
>>  5) Spock
  MSG

def integer?(num)
  /^-?\d*$/.match(num) ? true : false
end

def valid_input?(input)
  integer?(input) && (1..5).include?(input.to_i)
end

moves = {
  rock: ['SCISSORS', 'LIZARD'],
  paper: ['ROCK', 'SPOCK'],
  scissors: ['PAPER', 'LIZARD'],
  lizard: ['PAPER', 'SPOCK'],
  spock: ['SCISSORS', 'ROCK']
}

res = {
  player: {
    move: '',
    score: 0
  },
  computer: {
    move: '',
    score: 0
  }
}

# Moves input translation
def choice_to_word(input)
  move = case input
          when '1'
            'ROCK'
          when '2'
            'PAPER'
          when '3'
            'SCISSORS'
          when '4'
            'LIZARD'
          when '5'
            'SPOCK'
          end
  move
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

def center(msg)
  msg.center(L_LENGTH)
end

def player_move(res, move_prompt)
  pmove = ''
  loop do
    puts move_prompt
    print '>> '
    pmove = gets.chomp
    break if valid_input?(pmove)
    prompt "Invalid input..."
  end
  pmove
end

def display_moves(name, res)
  puts ''
  puts center("MOVES")
  print name
  puts 'Computer'.rjust(L_LENGTH - name.length)
  puts LINE
  print res[:player][:move]
  puts res[:computer][:move].rjust(L_LENGTH - res[:player][:move].length)
  puts "\n\n"
end

def get_winner(moves, res)
  player = res[:player]
  computer = res[:computer]
  if moves[player[:move].downcase.to_sym].include?(computer[:move])
    winner = res[:player]
  elsif player[:move] == computer[:move]
    winner = ''
  else
    winner = res[:computer]
  end
  winner
end

def display_results(winner, res)
  player = res[:player]
  computer = res[:computer]
  if winner == player
    puts center("#{player[:move]} beats #{computer[:move]}!")
    flash(center(">>> YOU WIN! <<<"))
  elsif winner == computer
    puts center("#{computer[:move]} beats #{player[:move]}!")
    flash(center("YOU LOSE"))
  else
    flash(center("It's a draw!"))
  end
end

def display_score(name, res)
  pscore = res[:player][:score]
  cscore = res[:computer][:score]

  puts center('SCORE')
  print name
  puts 'Computer'.rjust(L_LENGTH - name.length)
  puts LINE
  print pscore
  puts cscore.to_s.rjust(L_LENGTH - pscore.to_s.length)
  puts LINE, ''
end

# Welcome user and get their name
prompt "Welcome to Rock, Paper, Scissors, Lizard, Spock!"

name = ''
loop do
  prompt 'Please enter your name:'
  print '>> '
  name = gets.chomp
  break unless name.empty?
end

L_LENGTH = name.length + 30
LINE = '-' * L_LENGTH

puts '', LINE
puts center(">>>>> Let's play, #{name}! <<<<<")
puts LINE, ''

loop do # Main loop
  # Get moves
  res[:player][:move] = choice_to_word(player_move(res, move_prompt))
  res[:computer][:move] = moves.keys.sample.to_s.upcase

  # Get results and update score
  winner = get_winner(moves, res)
  winner[:score] += 1

  # Display output
  display_moves(name, res)
  display_results(winner, res)
  display_score(name, res)


  # Prompt for another game
  prompt "Want to have another go? (y/n)"
  print ">> "
  answer = gets.chomp.downcase

  break unless ['y', 'yes'].include?(answer)
end

puts '', LINE
puts center("Thanks for playing, #{name}!")
puts LINE
