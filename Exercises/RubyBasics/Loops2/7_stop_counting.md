The method below counts from 0 to 4. Modify the block so that it prints the current number and stops iterating when the current number equals `2`.

```ruby
5.times do |index|

# ...

end
```

Solution

```ruby
5.times do |index|
  puts index
  break if index == 2
end
```

Discussion

The `times` method counts from 0 to one less than the specified number. In this case, that number is 5. The block parameter `index` represents the current iteration number. We can print the current number with `puts index`.

To stop the loop, we can simply add `break`. However, we want to only stop iterating when the current number equals `2`. We can do this by adding the `if index == 2` condition to break.
