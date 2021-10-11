# Clear terminal
system("clear") || system("cls")

# HELPER METHODS, VARIABLES, AND CONSTANTS
# Formatting

def prompt(message)
  print ">> #{message}"
end

move_prompt = <<-MSG
>> Make your move (1-5):
>>  1) Rock
>>  2) Paper
>>  3) Scissors
>>  4) Lizard
>>  5) Spock
  MSG

def flash(msg)
  5.times do
    print "\r#{msg}"
    sleep 0.5
    print "\r#{' ' * msg.size}"
    sleep 0.5
  end
  print "\r#{msg}\n\n"
end

def center(msg)
  msg.center(L_LENGTH)
end

def display_flash_msg(header_msg, flash_msg)
  puts center(header_msg)
  puts LINE, ''
  flash center(flash_msg)
end

def display_table(header, left_row, right_row)
  puts ''
  puts center(header)
  puts LINE
  print NAME
  puts 'Computer'.rjust(L_LENGTH - NAME.length)
  puts LINE
  print left_row
  puts right_row.to_s.rjust(L_LENGTH - left_row.to_s.length)
  puts "\n\n"
end

# Input validation

def integer?(num)
  /^-?\d*$/.match(num) ? true : false
end

def valid_input?(input)
  integer?(input) && (1..5).include?(input.to_i)
end

# Results methods

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

def player_move(move_prompt)
  pmove = ''
  loop do
    puts move_prompt
    prompt ""
    pmove = gets.chomp
    break if valid_input?(pmove)
    prompt "Invalid input...\n"
  end
  pmove
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

# Display methods
def display_results(winner, res)
  player = res[:player]
  computer = res[:computer]
  if winner == player
    res_msg = "#{player[:move]} beats #{computer[:move]}!"
    flash_msg = ">>> YOU WIN! <<<"
  elsif winner == computer
    res_msg = "#{computer[:move]} beats #{player[:move]}!"
    flash_msg = "YOU LOSE"
  else
    res_msg = ''
    flash_msg = "It's a draw!"
  end
  display_flash_msg(res_msg, flash_msg)
end

def get_match_winner(res)
  match_winner = ''
  if res[:player][:score] == (2 || 3)
    match_winner = NAME
  elsif res[:computer][:score] == (2 || 3)
    match_winner = 'Computer'
  end
  match_winner
end

def display_match_winner(match_winner)
  if match_winner == NAME
    flash_msg = '>>> CONGRATULATIONS! <<<'
  else
    flash_msg = 'Better luck next time!'
  end
  winner_msg = "MATCH WINNER: #{match_winner}"
  display_flash_msg(winner_msg, flash_msg)
end

moves = {
  rock: ['SCISSORS', 'LIZARD'],
  paper: ['ROCK', 'SPOCK'],
  scissors: ['PAPER', 'LIZARD'],
  lizard: ['PAPER', 'SPOCK'],
  spock: ['SCISSORS', 'ROCK']
}

## START GAME
# Welcome user and get their name
puts '', ">>>>> Welcome to Rock, Paper, Scissors, Lizard, Spock! <<<<<", ''

name = ''
loop do
  prompt 'Please enter your name: '
  name = gets.chomp
  break unless name.empty?
end

NAME = name
L_LENGTH = NAME.length + 30
LINE = '-' * L_LENGTH

puts '', LINE
puts center(">>>>> Let's play, #{NAME}! <<<<<")
puts LINE, ''
sleep 2

loop do # Match loop
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
  match_winner = ''
  n = 1
  loop do # Game loop
    # Clear terminal
    system("clear") || system("cls")

    puts '', center('BEST OUT OF THREE'), ''
    display_table('SCOREBOARD', res[:player][:score], res[:computer][:score])
    sleep 0.7
    puts center("----- Round #{n} -----"), ''

    # Get moves
    res[:player][:move] = choice_to_word(player_move(move_prompt))
    res[:computer][:move] = moves.keys.sample.to_s.upcase

    # Get results and update score
    winner = get_winner(moves, res)
    winner[:score] += 1 unless winner.empty?

    # Display output
    sleep 0.5
    display_table('MOVES', res[:player][:move], res[:computer][:move])
    display_results(winner, res)
    sleep 1

    match_winner = get_match_winner(res)

    break unless match_winner.empty?
    n += 1
  end

  # Clear terminal
  system("clear") || system("cls")
  sleep 1

  # Display match score and winner
  puts '', center('***** MATCH OVER *****'), ''
  display_table('FINAL SCORE', res[:player][:score], res[:computer][:score])
  puts ''
  display_match_winner(match_winner)
  puts LINE

  # Prompt for another game
  sleep 1
  prompt "Want to have another go? (y/n): "
  answer = gets.chomp.downcase

  break unless ['y', 'yes'].include?(answer)
end

puts '', LINE
puts center("Thanks for playing, #{NAME}!")
puts LINE
