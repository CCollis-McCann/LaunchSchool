### Practice Problem 1

Given the array below

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```

Turn this array into a hash where the names are the keys and the values are the positions in the array.

Solution 1

```ruby
flintstones_hash = {}
flintstones.each_with_index do |name, index|
flintstones_hash[name] = index
end
```

Alternate Solution

```ruby
flintstones.each_with_index.to_h
```

### Practice Problem 2

Add up all of the ages from the Munster family hash:

```ruby
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}
```

Solution 2

One solution would be to assign a variable to an initial value of `0` and then iterate through the Hash adding each value in turn to the total.

```ruby
total*ages = 0
ages.each { |*,age| total_ages += age }
total_ages # => 6174
```

Another option would be to use a `Enumerable#inject` method.

```ruby
ages.values.inject(:+) # => 6174
```

This uses `ages.values` to make an array, then uses the `inject` method which is part of the `Enumerable` module. The strange-looking parameter to inject is simply a variety of the `inject` method which says "apply the `+` operator to the accumulator and object parameters of `inject`".

### Practice Problem 3

In the age hash:

```ruby
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 402,
  "Eddie" => 10
}
```

remove people with age 100 and greater.

Solution 3

```ruby
ages.keep*if { |_, age| age < 100 }
```

You could also use `#select!` here. When using similar methods however, it is important to be aware of the subtle differences in their implementation. For example, the Ruby Documentation for `Hash#select!` tells us that it is "Equivalent to `Hash#keep_if`, but returns `nil` if no changes were made", though in this case that wouldn't have made any difference.

### Practice Problem 4

Pick out the minimum age from our current Munster family hash:

```ruby
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}
```

Solution 4

```ruby
ages.values.min
```

### Practice Problem 5

In the array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Find the index of the first name that starts with "Be"

Solution 5

```ruby
flintstones.index { |name| name[0, 2] == "Be" }
```

### Practice Problem 6

Amend this array so that the names are all shortened to just the first three characters:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Solution 6

```ruby
flintstones.map! { |name| name[0, 3] }
```

### Practice Problem 7

Create a hash that expresses the frequency with which each letter occurs in this string:

```ruby
statement = "The Flintstones Rock"
```

eg:

```ruby
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
```

Solution 7

```ruby
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
```

### Practice Problem 8

What happens when we modify an array while we are iterating over it? What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]

numbers.each do |number|
  p number
  numbers.shift(1)
end
```

What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]

numbers.each do |number|
  p number
  numbers.pop(1)
end
```

Solution 8

first one...

```
1
3
```

second one...

```
1
2
```

To better understand what is happening here, we augment our loop with some additional "debugging" information:

```ruby
numbers = [1, 2, 3, 4]

numbers.each_with_index do |number, index|
  p "#{index} #{numbers.inspect} #{number}"
  numbers.shift(1)
end
```

The output is:

```
"0 [1, 2, 3, 4] 1"
"1 [2, 3, 4] 3"
```

From this we see that our array is being changed as we go (shortened and shifted), and the loop counter used by `#each` is compared against the current length of the array rather than its original length.

In our first example, the removal of the first item in the first pass changes the value found for the second pass.

In our second example, we are shortening the array each pass just as in the first example...but the items removed are beyond the point we are sampling from in the abbreviated loop.

In both cases we see that iterators DO NOT work on a copy of the original array or from stale meta-data (length) about the array. They operate on the original array in real time.

### Practice Problem 9

As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...`titleize`. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

```ruby
words = "the flintstones rock"
```

```ruby
words = "The Flintstones Rock"
```

Write your own version of the rails titleize implementation.

Solution 9

```ruby
words.split.map { |word| word.capitalize }.join(' ')
```

### Practice Problem 10

Given the munsters hash below

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

```ruby
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" }
}
```

Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

Solution 10

```ruby
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
```
