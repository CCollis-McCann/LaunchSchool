#### GAME VARIABLES ####
VALID_CHOICES = ['r', 'p', 'sc', 'l', 'sp']

WINNING_COMBINATIONS = {
  'r' => ['sc', 'l'],
  'p' => ['r', 'sp'],
  'sc' => ['p', 'l'],
  'l' => ['sp', 'p'],
  'sp' => ['r', 'sc']
}

WELCOME = <<-MSG
Welcome to "Rock, Paper, Scissors, Lizard, Spock".
The rules (according to Sheldon Cooper) are;
Scissors cuts Paper
Paper covers Rock
Rock crushes Lizard
Lizard poisons Spock
Spock smashes Scissors
Scissors decapitates Lizard
Lizard eats Paper
Paper disproves Spock
Spock vaporizes Rock
(and as it always has) Rock crushes Scissors
MSG

score_board = {
  player: 0,
  computer: 0
}

#### HELPER FUNCTIONS ####
def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  WINNING_COMBINATIONS[first].include?(second)
end

#### MAIN FUNCTIONS ####
def reset_score_board(score_board)
  score_board[:player] = 0
  score_board[:computer] = 0
end

def get_user_choice
  choice = ''
  loop do
    prompt('Choose: r - rock, p - paper, sc - scissors, sp - spock, l -lizard')
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice...")
    end
  end
  choice
end

def get_computer_choice
  VALID_CHOICES.sample
end

def track_score(user_choice, computer_choice, score_board)
  if win?(user_choice, computer_choice)
    score_board[:player] += 1
  elsif win?(computer_choice, user_choice)
    score_board[:computer] += 1
  end
end

def display_choices(user_choice, computer_choice)
  "You chose #{user_choice}, the computer chose #{computer_choice}"
end

def display_result(player, computer)
  if win?(player, computer)
    'You win!'
  elsif win?(computer, player)
    'Computer wins!'
  else
    "It's a draw!"
  end
end

def display_score(score_board)
  "Player = #{score_board[:player]} : Computer = #{score_board[:computer]}"
end

def clear_screen
  sleep(2)
  system('clear')
end

def winner?(score_board)
  score_board[:player] == 5 || score_board[:computer] == 5
end

def play_again?
  prompt('Do you want to play again? Please enter y/yes to begin')
  answer = gets.chomp.downcase
  answer == 'y' || answer == 'yes' ? true : false
end

#### MAIN GAME ####
prompt(WELCOME)

loop do
  reset_score_board(score_board)
  loop do
    user_choice = get_user_choice
    computer_choice = get_computer_choice

    track_score(user_choice, computer_choice, score_board)

    prompt(display_choices(user_choice, computer_choice))
    prompt(display_result(user_choice, computer_choice))
    prompt(display_score(score_board))
    clear_screen
    break if winner?(score_board)
  end
  break unless play_again?
end

prompt('Thanks for playing, good bye!')
