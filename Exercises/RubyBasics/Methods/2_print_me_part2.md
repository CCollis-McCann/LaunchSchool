Write a method named `print_me` that returns `"I'm printing the return value!"` when using the following code.

```
puts print_me
```

Solution

```ruby
def print_me
  "I'm printing the return value!"
end

puts print_me
```

Discussion

When you don't use `#puts` within the method or when you invoke the method, then nothing will be printed. This doesn't mean that there's nothing _available_ to print though. Methods will **always** return something. In this case, `print_me` is returning the string `"I'm printing the return value!"`. Therefore, to print that string, all we need to do is place `#puts` before the method invocation.
