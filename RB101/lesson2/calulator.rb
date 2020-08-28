# ask the usert for two numbers
# ask the user for an operation to perform
# performa the operation on the two numbers
# output the number

puts 'Welcome to Calculator'

puts 'Please enter the first number...'
number_one = gets.chomp

puts 'Please enter the second number...'
number_two = gets.chomp

puts 'What calculation would you like to perform? 1) add, 2) subtract, 3) multiply 4) divide'
operator = gets.chomp

if operator == '1'
  result = number_one.to_i + number_two.to_i
elsif operator == '2'
  result = number_one.to_i - number_two.to_i
elsif operator == '3'
  result = number_one.to_i * number_two.to_i
elsif operator == '4'
  result = number_one.to_f / number_two.to_f
end

puts "Your calculation equals #{result}"
