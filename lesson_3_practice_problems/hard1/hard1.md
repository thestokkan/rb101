# Question 1

What do you expect to happen when the greeting variable is referenced in the last line of the code below?

```ruby
if false
  greeting = "hello world"
end

greeting
```

## Answer
~~Error message: Undefined local variable 'greeting'.
The variable `greeting` is only initialized if the expression within the `if`
statement is executed. Since `if false` never returns true, the expression will
not be executed and the variable will not be initialized.~~ WRONG

When a local variable is initialized within a block, it will be initialized
to `nil` **even if the block is never executed**!

# Question 2

What is the result of the last line in the code below?

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```

## Answer
{:a => "hi there"}

On `line 2`, local variable `informal_greeting` is initialized to the object referenced by `greetings[:a]`, which is the string object `"hi"`. The string object is then mutated on `line 3`. This will be reflected both in `informal_greeting` and in `greeting`, since they both are referencing this object.


# Question 3

In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

What will be printed by each of these code groups?

A)

```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

B)

```ruby
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

C)

```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

## Answer
A)
one is: one
two is: two
three is: three

Re-assignment within the method definition -> the change will not be reflected in the variables outside the method definition.

B)
one is: one
two is: two
three is: three

Re-assignment within the method definition -> the change will not be reflected in the variables outside the method definition.

C)
one is: two
two is: three
three is: one

Mutating method `#gsub!` applied within method definition -> change is reflected in variables outside the method definition.


# Question 4

Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called `is_an_ip_number`? that determines if a string is a numeric string between `0` and `255` as required for IP numbers and asked Ben to use it.

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```

Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a `false` condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.

## Answer
`Line 2`: Create array of dot separated numbers as strings
`Line 3`: Loop as long as array has elements
`Line 4`: Pop the last word from array and assign it to local variable `word`
`Line 5`: If the `is_an_ip_number?` method returns `true`, continue, if not, break out of loop.
`Line 7`: Return `true` no matter what has happened before (FIX)

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  return true
end
```

dot_separated_ip_address?("10.4.5.11") # => true
dot_separated_ip_address?("10.4.5.11") # => true
dot_separated_ip_address?("10.4.5.11.2.1.4.4.3") # => false
dot_separated_ip_address?("10.4.5") # => false
