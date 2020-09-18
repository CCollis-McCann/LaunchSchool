Modify the following code so that double-quotes are used instead of single-quotes.

```ruby
puts 'It\'s now 12 o\'clock.'
```

Expected output:

```
It's now 12 o'clock.
```

Solution

```ruby
puts "It's now 12 o'clock."
```

Discussion

When creating strings, we have the option of using either double-quotes or single-quotes. It's important to know the differences between them, especially when single-quotes are included in the text, like in the example.

Single-quotes don't allow for escape sequences. For instance, if you wanted to start a new line:

```ruby
'Hello\nworld' # => Hello\nworld
```

The escape sequence (`\n`) will be displayed instead of interpreted. There is one exception, however, which is the escaping of other single-quotes, such as:

```ruby
'12 o\'clock'
```

Even though this is perfectly valid Ruby, double-quotes are preferred in this situation, according to the Ruby Style Guide.
