=begin
Consider the word "abode".
The letter `a` is in position 1 and `b` is in position 2.
In the alphabet, `a` and `b` are also in positions 1 and 2.
​
The letters `d` and `e` in "abode" occupy the positions they would occupy in the alphabet, which are positions 4 and 5.
​
Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,
​
solve(["abode", "ABc", "xyzD"]) == [4, 3, 1]
​
Input will consist of alphabet characters, both uppercase and lowercase. No spaces.
​
solve(["abode", "ABc", "xyzD"]) == [4,3,1]
solve(["abide", "ABc", "xyz"]) == [4,3,0]
solve(["encode", "abc", "xyzD", "ABmD"]) == [1, 3, 1, 3]
​
​
Problem
- Get index of each character of the word
- criteria:
- "The index of the character in the word should occupy their position in the alphabet"
- Given an Array with Strings/words
- Return an Array with count the characters that meet the criteria
- Ignore case and no spaces
- `a` in "abode" in position 0.
​
​
Example and Implicit Rules
- Case doesn't matter
- first example:
"abode" => a, b, d, and e match the criteria => 4
"ABc" => A, B, c match the criteria => 3
"xyzD" => only D => 1
​
Data Structure
- Input? Array of Strings
- Output? Array of Integers
​
Array of String ---> Array --> final Array of Integers
​
Algorithm
​
Nick
1. Create Hash with all alphabet. Key is char, value is position
2. Iterate through the Array of words
3. Iterate through each word, to get the individual chars
4. Once you have the chars, check it agains the alphabet position
5. Every check that's correct, increment "matches"
6. Return final Array of Integers
​
ALPHA = {'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7, 'i' => 8, 'o' => 14, 'm' => 12, 'n' => 13, 'x' => 23, 'y' => 24, 'z' => 25}
​
def solve(array)
  array.map do |word|
    matches = 0
    word.split.each.with_index do |x,i|
      matches += 1 if i == ALPHA[x.downcase]
    end
    matches
  end
end
​
puts solve(["abode", "ABc", "xyzD"]) == [4,3,1]
puts solve(["abide", "ABc", "xyz"]) == [4,3,0]
puts solve(["encode", "abc", "xyzD", "ABmD"]) == [1, 3, 1, 3]
​
puts solve(["abode", "ABc", "xyzD"])
puts solve(["abide", "ABc", "xyz"])
puts solve(["encode", "abc", "xyzD", "ABmD"])
​
Jessica
1. Initialize a variable , and that variable is a string "abcde..."
2. Empty variable to push matching occurrences
3. Check index and alphabet index
4. Count those matching characters
​
Craig
- iterate over each string in array
- iterate over each character in the string
- check if character index == alpbhabetical position (hash)
- if true add to count
- after each string add count to final array
- return final array
​
Sulaiman
1. Initialize a variable 'alphabets' Array to get the indexes of each letter
2. Get indexes of each String of Input Array
3. Compare each index of String to Index of Alphabets
4. Push the char into Array
​
Carolina
1. Define a method with one parameter (array)
2. Initialize a variable that has the value of an alphabet array for comparison
        Alphabet [a,b,c,d ... ] and uppercase
3. Initialize a variable that has the value of an empty array to push integers to.
        result = []
4. Set a counter
        counter = 0
5. Create a loop
        loop
6. Conditional statement
        if the index of each letter in the word matches position in alphabet,
        count how many letters that is and push the total count into the result array
7. Set a break statement to stop once the counter has reached the size of the array.
​
Mandy
1. Initialize an Array that contains the letters of the alphabet
2. Initialize a `count` variable to 0
3. Iterate through each String of the Input Array
   - Subproblem: on each String, Iterate through each character
      - validate each character of the String to see if the character meets the criteria:
      - Take the `index of the character in the String` and compare it to `the index of the letter in the alphabet`
      - downcase the char
      - Increment count variable if these indexes are the same
      - After checking all the characters, push the count in a final Array
4. Return the final Array with all the counts
=end
​
def solve(arr)
  arr.map { |word| count_correct_position(word) }
end
​
def count_correct_position(word)
  alpha = ('a'..'z').to_a
  count = 0
  ​
  word.split('').each.with_index do |char, i|
    if alpha.index(char.downcase) == i
      count += 1
    end
  end
  ​
  count
end
​
p solve(["abode", "ABc", "xyzD"]) == [4, 3, 1]
p solve(["abide", "ABc", "xyz"]) == [4, 3, 0]
p solve(["encode", "abc", "xyzD", "ABmD"]) == [1, 3, 1, 3]
