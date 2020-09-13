=begin

# The objective is to return all pairs of integers from a given array of integers that have a difference of 2.
# The result array should be sorted in ascending order of values.
# Assume there are no duplicate integers in the array.
# The order of the integers in the input array should not matter.

# PROBLEM
- input is an array
- output is an array
- does the output array have nested arrays of pairs? Or?
- can you reuse a number in multiple pairs? or only once?
- do we mutate the input? or return a new array as output?
- what does 'ascending order of values' mean as a pair?
- pairs should have a difference of 2: does that include both 2 more and 2 less? or only one direction?
- no duplicates in our input array
- only integers in the input array
- are there negative integers?
- the order of the integers in the input array should not matter — does that mean we always need to do something to it? (do we put them in the right order?)

# EXAMPLES
p difference_of_two([1, 2, 3, 4]) ==  [[1, 3], [2, 4]]
p difference_of_two([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p difference_of_two([1, 23, 3, 4, 7]) == [[1, 3]]
p difference_of_two([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]
p difference_of_two([2, 4]) == [[2, 4]]
p difference_of_two([1, 4, 7, 10, 13]) == []

- all input is an array of integers (positive)
- output is a new array of nested items
- ascending: pairs are sorted by the first number in the pair
- pairs themselves are in ascending order
- when no pairs are found, return a one dimensional empty array
- we can reuse numbers in multiple pairs

DATA STRUCTURES
- arrays
  - nested arrays
- integers

ALGORITHM

Given an array of integers

initialize an empty array called results

Iterate through each integer
  Initialize a variable called current_number
  Assign the first element of the array as current_number
  if the difference between current_number and the next ones after it is == 2,
    Create a nested array and shovel it into the results array
    Reassign the current_number to the next integer being iterated on.

Return a results array
--------------------------------

First, sort the input array into an ascending order
Check each number of the array plus two to find a match
If there's a match, create a new array and append it to a new existing blank array
If there's no match, check the next number

Create a blank array
SORT the input array of numbers into ascending order
ITERATE through each NUMBER of the array
  For each iteration,
  Take the NUMBER in the array and add two
  IF NUMBER + 2 is found in the array
    ADD a nested array containing NUMBER + 2
  OTHERWISE
    Do nothing, move on to the next

--------------------------------
- create an empty output array
- iterate over each index of input array
- check if any num in input array === num + 2
- if true add num and num + 2 as nested array (without mutating/removing from original array) to output array
- return output array
--------------------------------
- Create a method that takes an array object
- Sort the elements of the array object from lowest to highest and assign that to the sorted_array local variable
- Bind the new variable “result” to an empty array
- Iterate through each element of “sorted_array” except the last one
    - When the next element has a value of 2 larger than the current element, insert them to “result” as an array
        - The smaller element should be on the left and the other on the right
    - Otherwise, do nothing
- The method should return “result”
--------------------------------
given array `numbers`
1. initialize empty array `pairs`
2. loop through each `number` in `numbers`
   1. loop through each `alt_number` in `numbers`
      1. if `number` - `alt_number` == 2
      2. then append [`alt_number`, `number`] to `pairs`
3. sort `pairs` in ascending order based on first element of pair
4. return `pairs`
--------------------------------
- sort all numbers from least to greatest
- create all possible pairs of digits
- look at each pair and if there is a difference of 2 between them (second number minus first number), save it. Otherwise, skip it.
- return all saved pairs or an empty array if there were none

=end

# def difference_of_two(numbers)
#   pairs_array = []
#   numbers.sort.each do |number|
#     if numbers.include?(number + 2)
#       pairs_array << [number, number + 2]
#     end
#   end
#   pairs_array
# end

def difference_of_two(numbers)
  numbers.sort.combination(2).filter { |pair| pair[1] - pair[0] == 2 }
end

p difference_of_two([1, 2, 3, 4]) ==  [[1, 3], [2, 4]]
p difference_of_two([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p difference_of_two([1, 23, 3, 4, 7]) == [[1, 3]]
p difference_of_two([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]
p difference_of_two([2, 4]) == [[2, 4]]
p difference_of_two([1, 4, 7, 10, 13]) == []
