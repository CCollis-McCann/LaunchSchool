The following code outputs a countdown from 10 to 1. Modify the code so that it counts from 1 to 10 instead.

```ruby
count = 10

until count == 0
  puts count
  count -= 1
end
```

Solution

```ruby
count = 1

until count > 10
  puts count
  count += 1
end
```

Discussion

The `until` loop is the opposite of the `while` loop. `while` iterates until the condition evaluates to `false`. `until` iterates until the condition evaluates to `true`. In this case, the condition evaluates to `true` when `count` equals `0`. We want it to be the opposite though. We would like `until` to iterate until `count` is greater than `10`. We use greater than here so `10` is included in the output. If we used `==`, then `9` would be the last number printed.

There are two more things that need to be changed to fill the requirements. `count` should be initialized as `1` instead of `10` and, within the loop, `count` should add `1` instead of subtract `1`.
