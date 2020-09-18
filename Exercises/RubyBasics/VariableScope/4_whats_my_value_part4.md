What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a
```

Solution

```
Xy-zy
```

Discussion

This problem looks remarkably similar to the first problem in this set. However, this time we are working with a string, and we are assigning to `b[2]` instead of `b`.

The result is quite different. When we were working with a numeric variable, no changes were made to `a`. This was due to the fact that numbers are immutable, and assignment merely changes the object that a variable references. Now, though, Strings are mutable - they can be modified - and, in particular, the method `String#[]=` is a mutating method; it actually modifies the string. Since we are actually modifying the string referenced by `b`, and `b` references the same string as `a`, the result from printing `a` shows an update to the value of the string.
