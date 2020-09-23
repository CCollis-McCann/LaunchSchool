### Practice Problem 1

What is the return value of the select method below? Why?

```ruby
[1, 2, 3].select do |num|
num > 5
'hi'
end
```

```
# => [1, 2, 3]
```

`select` performs selection based on the truthiness of the block's return value. In this case the return value will always be `'hi'`, which is a "truthy" value. Therefore `select` will return a new array containing all of the elements in the original array.

### Practice Problem 2

How does `count` treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
str.length < 4
end
```

> If a block is given, counts the number of elements for which the block returns a true value.

Based on this information, we can conclude that `count` only counts an element if the block's return value evaluates to `true`. This means that `count` considers the truthiness of the block's return value.

### Practice Problem 3

What is the return value of `reject` in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

```
# => [1, 2, 3]
```

Since `puts` always returns `nil`, you might think that no values would be selected and an empty array would be returned. The important thing to be aware of here is how `reject` treats the return value of the block. `reject` returns a new array containing items where the block's return value is "falsey". In other words, if the return value was `false` or `nil` the element would be selected.

### Practice Problem 4

What is the return value of `each_with_object` in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
hash[value[0]] = value
end
```

```
# => { "a" => "ant", "b" => "bear", "c" => "cat" }
```

Based on our knowledge of `each`, it might be reasonable to think that `each_with_object` returns the original collection. That isn't the case, though. When we invoke `each_with_object`, we pass in an object (`{}` here) as an argument. That object is then passed into the block and its updated value is returned at the end of each iteration. Once `each_with_object` has iterated over the calling collection, it returns the initially given object, which now contains all of the updates.

In this code, we start with the hash object, `{}`. On the first iteration, we add `"a" => "ant"` to the hash. On the second, we add `"b" => "bear"`, and on the last iteration, we add `"c" => "cat"`. Thus, `#each_with_object` in this example returns a hash with those 3 elements.

### Practice Problem 5

What does `shift` do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

`shift` destructively removes the first key-value pair in `hash` and returns it as a two-item array. If we didn't already know how `shift` worked, we could easily learn by checking the docs for `Hash#shift`. The description for this method confirms our understanding:

> Removes a key-value pair from hash and returns it as the two-item array [ key, value ], or the hash’s default value if the hash is empty.

There are quite a few Ruby methods, and you're not expected to know them all. That's why knowing how to read the Ruby documentation is so important. If you don't know how a method works you can always check the docs.

### Practice Problem 6

What is the return value of the following statement? Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

```
# => 11
```

There are a couple things going on here. First, `pop` is being called on the array. `pop` destructively removes the last element from the calling array and returns it. Second, `size` is being called on the return value by `pop`. Once we realize that `size` is evaluating the return value of `pop` (which is `"caterpillar"`) then the final return value of `11` should make sense.

### Practice Problem 7

What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

The return value of the block is determined by the return value of the last expression within the block. In this case the last statement evaluated is `num.odd?`, which returns a boolean. Therefore the block's return value will be a boolean, since `Integer#odd?` can only return `true` or `false`.

Since the `Array#any?` method returns `true` if the block ever returns a value other than `false` or `nil`, and the block returns `true` on the first iteration, we know that `any?` will return `true`. What is also interesting here is `any?` stops iterating after this point since there is no need to evaluate the remaining items in the array; therefore, `puts num` is only ever invoked for the first item in the array: `1`.

### Practice Problem 8

How does take work? Is it destructive? How can we find out?

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

```
irb :001 > arr = [1, 2, 3, 4, 5]
irb :002 > arr.take(2)
=> [1, 2]
irb :003 > arr
=> [1, 2, 3, 4, 5]
```

By reading the docs and testing the method in `irb`, we're able to determine that `Array#take` selects a specified number of elements from an array. We're also able to verify that it isn't a destructive method.

### Practice Problem 9

What is the return value of map in the following code? Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

```
# => [nil, "bear"]
```

There are some interesting things to point out here. First, the return value of `map` is an array, which is the collection type that `map` always returns. Second, where did that `nil` come from? If we look at the `if` condition (`value.size > 3`), we'll notice that it evaluates to `true` when the length of `value` is greater than `3`. In this case, the only value with a length greater than `3` is `'bear'`. This means that for the first element, `'ant'`, the condition evaluates to `false` and `value` isn't returned.

When none of the conditions in an `if` statement evaluates as `true`, the `if` statement itself returns `nil`. That's why we see `nil` as the first element in the returned array.

### Practice Problem 10

What is the return value of the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

We can determine the block's return value by looking at the return value of the last statement evaluated within the block. In this case it's a bit tricky because of the `if` statement. For the first element, the `if` condition evaluates to `false`, which means `num` is the block's return value for that iteration. For the rest of the elements in the array, `num > 1` evaluates to `true`, which means `puts num` is the last statement evaluated, which in turn, means that the block's return value is `nil` for those iterations.

Therefore, the return value of `map` is:

```
# => [1, nil, nil]
```
