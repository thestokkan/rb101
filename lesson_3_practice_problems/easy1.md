# Question 1
What would you expect the code below to print out?

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

## Answer
1

2

2

3

Comment: The #uniq method is not mutating. However, if we were to use the
mutating method #uniq!, the output would have been

1

2

3


# Question 2

Describe the difference between `!` and `?` in Ruby. And explain what would
happen in the following scenarios:

  1. what is `!=` and where should you use it?
  2. put `!` before something, like `!user_name`
  3. put `!` after something, like `words.uniq!`
  4. put `?` before something
  5. put `?` after something
  6. put `!!` before something, like `!!user_name`

## Answer
If a method name is suffixed with `!`, it is an indicator that the method is
destructive (mutates its caller and/or arguments). If a method name is suffixed
with `?`, it is an indicator that the method will return a boolean value
(`true` or `false`). Note! These are conventions and not Ruby syntax!

An expression prepended with `!` flips the truthiness of the expression.
That is, the truthiness of the expression becomes the opposite of what it would
have been without the `!`.

In conditional statements, `!=` can be interpreted as 'not equal' and will return
`true` if the two operands do not have equal values. `?` is used in ternary
conditional statements: `<expression> ? true_return : false_return`. This will evaluate the
truthiness of the `<expression>` and return `true_return` if it evaluates to
`true` and `false_return` if it evaluates to `false`.

1. what is `!=` and where should you use it?
  - 'Not equal', checks for inequality (compares values) in conditional expressions.
2. put `!` before something, like `!user_name`
  - Flips truthiness of whatever `!` prepends: `!true == false # => true`
3. put `!` after something, like `words.uniq!`
  - Implies destructive method (will mutate caller)
4. put `?` before something
  - No idea...
5. put `?` after something
  - After method name: method returns boolean value
  - In ternary conditional: evaluates truthiness of preceding expression
6. put `!!` before something, like `!!user_name`
  - Double negation. Returns boolean value of expression

# Question 3

Replace the word "important" with "urgent" in this string:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

## Answer
```ruby
advice.sub!('important', 'urgent')
```

# Question 4

The Ruby Array class has several methods for removing items from the array.
Two of them have very similar names. Let's see how they differ:

```ruby
numbers = [1, 2, 3, 4, 5]
```

What do the following method calls do (assume we reset `numbers` to the original
array between method calls)?

```ruby
numbers.delete_at(1)
numbers.delete(1)
```

## Answer
Both methods are destructive and modifies the array.
- `numbers.delete_at(1)` deletes the item at *index 1*:
```ruby
numbers.delete_at(1)
# => 2
numbers
# => [1, 3, 4, 5]
p numbers
```
- `numbers.delete(1)` deletes *item `1`*:
```ruby
numbers.delete(1)
# => 1
p numbers
# => [2, 3, 4, 5]
```

# Question 5

Programmatically determine if 42 lies between 10 and 100.

hint: Use Ruby's range object in your solution.

## Answer
```ruby
(10..100).include?(42)
```

Note: Solution used `Range#cover`

# Question 6

Starting with the string:

`famous_words = "seven years ago..."`

show two different ways to put the expected "Four score and " in front of it.

## Answer

One
```ruby
famous_words = "Four score and " + famous_words
```

Two
```ruby
famous_words = "Four score and " << famous_words
```

Three
```ruby
famous_words.prepend("Four score and ")
```

# Question 7

If we build an array like this:

```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```

We will end up with this "nested" array:

```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```

Make this into an un-nested array.

## Answer
```ruby
flintstones.flatten!
```

# Question 8

Given the hash below

```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```

Turn this into an array containing only two elements: Barney's name and Barney's number

## Answer

Alt. 1
```ruby
flintstones = flintstones.to_a[2]
flintstones
# => ["Barney", 2]
```

Alt. 2
```ruby
flintstones.select! { |k,v| k == 'Barney' }
flintstones
# => {"Barney" => 2}
flintstones = flintstones.to_a.flatten
flintstones
# => ["Barney", 2]
```

Solution
```ruby
flintstones.assoc("Barney")
#=> ["Barney", 2]
```
