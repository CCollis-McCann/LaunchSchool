Time for a check of your financial situation.

The output of the code below tells you that you have around $70. However, you expected your bank account to have about $238. What did we do wrong?

```ruby
# Financially, you started the year with a clean slate.

balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

# Let's see how much you've got now...

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end

[january, february, march].each do |month|
  balance = calculate_balance(month)
end

puts balance
```

Approach/Algorithm

We can test the `calculate_balance` method by adding a few test cases:

```ruby
puts calculate_balance({ income: [], expenses: [] }) == 0         #=> true
puts calculate_balance({ income: [100], expenses: [] }) == 100    #=> true
puts calculate_balance({ income: [], expenses: [100] }) == -100   #=> true
puts calculate_balance({ income: [100], expenses: [50] }) == 50   #=> true
puts calculate_balance({ income: [4, 3], expenses: [2, 1] }) == 4 #=> true
```

We can see that this method works as expected.

To check what might go wrong on lines 36-38, we can temporarily replace the month hashes with simpler data that will make it easier to see what happens:

```ruby
january  = { income: [500], expenses: [] }
february = { income: [100], expenses: [] }
march    = { income: [200], expenses: [] }
```

Now we expect our balance after these three months to be `800`, but instead the final `balance` output is `200`, the balance value of March. So it seems like we fail to add up the values.

Solution

```ruby
balance = 0

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end

[january, february, march].each do |month|
  balance += calculate_balance(month)
end

puts balance
```

Discussion

On line 32 of the original code, we simply re-assign `balance` to the return value of invoking `calculate_balance` with the current month's data. Instead, we want to increment `balance` by re-assigning it to the current value of `balance` plus the return value of `calculate_balance`.

Recall that `balance += calculate_balance(month)` is shorthand for `balance = balance + calculate_balance(month)`.
