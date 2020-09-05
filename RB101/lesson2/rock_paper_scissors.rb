VALID_CHOICES = ['rock', 'paper', 'scissors']
def test_method
  prompt('test message')
end

def prompt(message)
  puts("=> #{message}")
end

def display_result(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    prompt('You win!')
  elsif (computer == 'rock' && player == 'scissors') ||
        (computer == 'paper' && player == 'rock') ||
        (computer == 'scissors' && player == 'paper')
    prompt('Computer wins!')
  else
    prompt("It's a draw!")
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

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for playing, good bye!')
