The following array contains three names and numbers. Group each name with the number following it by placing the pair in their own array. Then create a nested array containing all three groups. What does this look like? (You don't need to write any code here. Just alter the value shown so it meets the exercise requirements.)

```ruby
['Dave', 7, 'Miranda', 3, 'Jason', 11]
```

Solution

```ruby
[['Dave', 7], ['Miranda', 3], ['Jason', 11]]
```

Discussion

Arrays are useful for many reasons but one of the great things about them is their ability to hold any object. This includes other arrays. Our solution takes each name and pairs it with the appropriate number by placing each group in its own array. We do this for all three of the names and numbers, then we simply place the newly created arrays into a new array. Thus, creating a nested array.
