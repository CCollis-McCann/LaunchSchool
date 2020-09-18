Using the following code, write a method called `car` that takes two arguments and prints a string containing the values of both arguments.

```ruby
car('Toyota', 'Corolla')
```

Expected output:

```
Toyota Corolla
```

Solution

```ruby
def car(make, model)
puts "#{make} #{model}"
end

car('Toyota', 'Corolla')
```

Discussion

When writing the car method it's important to keep two things in mind. First, make sure you're allowing for the correct number of parameters. If the method invocation provides two arguments, then the method must be able to accept two arguments and vice versa. Second, when printing the string, you should use `#puts` from inside the method. In this exercise, the method invocation isn't prepended by `#puts`, therefore, to print the string you have to print it from within the method.
