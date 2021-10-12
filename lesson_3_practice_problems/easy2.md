# Question 1

In this hash of people and their age,

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

see if "Spot" is present.

Bonus: What are two other hash methods that would work just as well for this solution?

## Answer
```ruby
# Check if present
ages.include?("Spot") # Bonus

ages.member?("Spot") # Bonus

ages.keys.any?("Spot")

ages.key?("Spot") # Main solution!
```

# Question 2

Starting with this string:

```ruby
munsters_description = "The Munsters are creepy in a good way."
```

Convert the string in the following ways (code will be executed on original munsters_description above):

"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

## Answer

```ruby
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!
```

# Question 3

We have most of the Munster family in our age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```

add ages for Marilyn and Spot to the existing hash

```ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```

## Answer
```ruby
ages.merge!(additional_ages)
```

# Question 4

See if the name "Dino" appears in the string below:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

## Answer
```ruby
advice.include?("Dino")
advice.match?("Dino")
```

# Question 5

Show an easier way to write this array:

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```

## Answer
```ruby
%w(Fred Barney Wilma Betty BamBam Pebbles)
```

# Question 6

How can we add the family pet "Dino" to our usual array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

## Answer
```ruby
flintstones << 'Dino'
flintstones.concat(['Dino'])
```

# Question 7

In the previous practice problem we added Dino to our array like this:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```

We could have used either `Array#concat` or `Array#push` to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)

## Answer
```ruby
flintstones.concat(['Dino', 'Hoppy'])
flintstones.push('Dino').push('Hoppy')
```

# Question 8

Shorten the following sentence:

`advice = "Few things in life are as important as house training your pet dinosaur."`

Review the `String#slice!` documentation, and use that method to make the return
value `"Few things in life are as important as "`.
But leave the advice variable as `"house training your pet dinosaur."`.

As a bonus, what happens if you use the `String#slice` method instead?

## Answer
```ruby
advice.slice!(/F.*as/)
```
## Bonus
If `#slice` is used instead, the original string will not be mutated.
The return value is the same.

## LS Solution
```ruby
advice.slice!(0, advice.index('house'))  # => "Few things in life are as important as "
p advice # => "house training your pet dinosaur."
```

# Question 9

Write a one-liner to count the number of lower-case 't' characters in the following string:

`statement = "The Flintstones Rock!"`

## Answer
```ruby
statement.count('t')
```

Alt.
```ruby
statement.chars.tally['t']
```
# Question 10

Back in the stone age (before CSS) we used spaces to align things on the screen.
If we had a table of Flintstone family members that was forty characters in width,
how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"


## Answer
``ruby
title.center(40)
```
