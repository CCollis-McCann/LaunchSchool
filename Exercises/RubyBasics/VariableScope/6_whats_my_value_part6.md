What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a
```

Solution

If you said this would issue an error message or raise an exception, you are correct. The error is:

```
'my_value': undefined local variable or method `a' for main:Object (NameError)
```

Discussion

Even though `a` is defined before `my_value` is defined, it is not visible inside `my_value`. Method definitions are self contained with respect to local variables. Local variables initialized inside the method definition are not visible outside the method definition, and local variables initialized outside the method definition are not visible inside the method definition.

Note, however, that local variables will be visible (via closures) inside blocks, procs, and lambdas.
