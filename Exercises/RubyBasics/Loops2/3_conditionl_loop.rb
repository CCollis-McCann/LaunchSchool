process_the_loop = [true, false].sample

loop do
  puts process_the_loop ? 'The loop was processed' : "The loop wasn't processed"
  break
end
