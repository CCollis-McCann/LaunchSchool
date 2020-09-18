What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a
```

Solution

```
7
```

Discussion

This problem is identical to the previous problem. The only thing we did is change the name `b` to `a`. Note that we can do this because method definitions are self-contained with respect to local variables. Local variables outside the method definition are not visible inside the method definition; so the top level `a` is not available inside `my_value`. Furthermore, local variables inside the method definition are not visible outside the method definition; so the `a` inside `my_value` is a local variable with no top-level visibility.
