require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'es'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

# /d - tests against all digits
# ^ - start of the string
# + - one or more of preceding matchers
# - end of the string
# will check only for integer (float won't match)
def valid_integer?(num)
  /^-?\d+$/.match(num)
end

# first validation checks for at least one digit
# second validation checks for zero or more digits [.] zero or more digits
def valid_float?(num)
  /\d/.match(num) && /^-?\d*\.?\d*$/.match(num)
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def operation_to_message(operator)
  word = case operator
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word # If code is added the method will still return the value of the case statement
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

# main loop
loop do
  number_one = ''
  loop do
    prompt(messages('first_number', LANGUAGE))

    number_one = gets.chomp

    if valid_number?(number_one)
      break
    else
      prompt(messages('valid_number', LANGUAGE))
    end
  end

  number_two = ''
  loop do
    prompt(messages('second_number', LANGUAGE))
    number_two = gets.chomp

    if valid_number?(number_two)
      break
    else
      prompt(messages('valid_number', LANGUAGE))
    end
  end

  prompt(messages('operator_prompt', LANGUAGE))

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('valid_operator', LANGUAGE))
    end
  end

  prompt("#{operation_to_message(operator)} your numbers...")

  result = case operator
           when '1'
             number_one.to_f + number_two.to_f
           when '2'
             number_one.to_f - number_two.to_f
           when '3'
             number_one.to_f * number_two.to_f
           when '4'
             number_one.to_f / number_two.to_f
           end

  prompt("Your calculation equals #{result}")

  prompt(messages('more_calculations', LANGUAGE))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('sign_off', LANGUAGE))
