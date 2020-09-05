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
Please choose from:
Rock = r
Paper = p
Scissors = sc
Lizard = l
Spock = sp
MSG

score_board = {
  player: 0,
  computer: 0
}

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  WINNING_COMBINATIONS[first].include?(second)
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

def track_score(player, computer, score_board)
  if win?(player, computer)
    score_board[:player] += 1
  elsif win?(computer, player)
    score_board[:computer] += 1
  end
end

def display_score(score_board)
  "Player = #{score_board[:player]} : Computer = #{score_board[:computer]}"
end

prompt(WELCOME)

loop do
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice...")
      end
    end

    computer_choice = VALID_CHOICES.sample

    puts("You chose #{choice}, the computer chose #{computer_choice}")

    track_score(choice, computer_choice, score_board)
    prompt(display_result(choice, computer_choice))
    prompt(display_score(score_board))
    break if score_board[:player] == 5 || score_board[:computer] == 5
  end

  prompt('Do you want to play again?')
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    score_board[:player] = 0
    score_board[:computer] = 0
  else
    break
  end
end

prompt('Thanks for playing, good bye!')
