VALID_CHOICES = ['r', 'p', 'sc', 'l', 'sp']

WINNING_COMBINATIONS = {
  'r' => ['sc', 'l'],
  'p' => ['r', 'sp'],
  'sc' => ['p', 'l'],
  'l' => ['sp', 'p'],
  'sp' => ['r', 'sc']
}

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
    prompt('You win!')
  elsif win?(computer, player)
    prompt('Computer wins!')
  else
    prompt("It's a draw!")
  end
end

def track_score(player, computer, score_board)
  if win?(player, computer)
    score_board[:player] += 1
  elsif win?(computer, player)
    score_board[:computer] += 1
  end
end

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

  display_result(choice, computer_choice)

  track_score(choice, computer_choice, score_board)

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for playing, good bye!')
