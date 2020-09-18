Using an `if/else` statement, run a loop that prints `"The loop was processed!"` one time if `process_the_loop` equals `true`. Print `"The loop wasn't processed!"` if `process_the_loop` equals `false`.

```ruby
process_the_loop = [true, false].sample
```

Solution

```ruby
process_the_loop = [true, false].sample

if process_the_loop
  loop do
  puts "The loop was processed!"
  break
  end
else
  puts "The loop wasn't processed!"
end
```

Discussion

The variable given to us, `process_the_loop`, will be assigned randomly to either `true` or `false`. Our goal here is to run the loop only if `process_the_loop` evaluates to `true`. We can use an `if/else` statement to accomplish this task.

To run a loop that prints `"The loop was processed!"` once, we can simply add a `break` immediately following `#puts` inside `loop`. We don't need to have any sort of counter variable in this case because we only need to print the string once. Then all we need to do is place `puts "The loop wasn't processed!"` in the `else` clause. This will print if `process_the_loop` evaluates to `false`.
