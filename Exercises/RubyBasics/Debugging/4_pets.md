Magdalena has just adopted a new pet! She wants to add her new dog, Bowser, to the `pets` hash. After doing so, she realizes that her dogs Sparky and Fido have been mistakenly removed. Help Magdalena fix her code so that all three of her dogs' names will be associated with the key `:dog` in the `pets` hash.

```ruby
pets = {
  cat: 'fluffy',
  dog: ['sparky', 'fido'],
  fish: 'oscar'
  }

pets[:dog] = 'bowser'

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}
```

Solution

Magdalena used element assignment to re-assign the value associated with the key `:dog`. Instead, she intended to access the list of dog names associated with the key `:dog` and add an element to it.

```ruby
pets = {
  cat: 'fluffy',
  dog: ['sparky', 'fido'],
  fish: 'oscar'
  }

pets[:dog].push('bowser')

p pets #=> {:cat=>"fluffy", :dog=>["sparky", "fido", "bowser"], :fish=>"oscar"}
```

Discussion

Using element reference, we can access the value associated with the key `:dog`.

```ruby
pets[:dog] #=> ['sparky', 'fido']
```

Because the returned value is an array, we can use the `Array#push` method to append an additional element (in this case, the String `'bowser'`) onto the end of the list.
