In the code below, two arrays containing several numbers are assigned to two variables, `array1` and `array2`.

```ruby
array1 = [1, 5, 9]
array2 = [1, 9, 5]
```

Compare `array1` and `array2` and print `true` or `false` based on whether they match.

Solution

```ruby
puts array1 == array2
```

Discussion

There's more than one way to compare arrays but perhaps the simplest way is using `==`. In the solution, we use `==` to compare the value of `array1` to the value of `array2` and print the return value, which is `false`, with `#puts`.

Note that `==` treats two Arrays as equal if they contain the same number of elements, and each element in one `Array` is equal to the corresponding element in the second `Array`.
