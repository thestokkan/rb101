# Question 1

Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days
  before computers had video screens).

For this practice problem, write a one-line program that creates the following
output 10 times, with the subsequent line indented 1 space to the right:

The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!


## Answer
```ruby
10.times { |n| puts ' ' * n + text }
```

# Question 2

The result of the following statement will be an error:

```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```

Why is this and what are two possible ways to fix this?

## Answer
`(40 + 2)` evaluates to the Integer `42` and It is not possible to concatenate
a string and an Integer. Therefore, the above code will raise a
TypeError: "No implicit conversion of Integer to String"

Fix 1
```ruby
puts "the value of 40 + 2 is " + (40 + 2).to_s
```

Fix 2
```ruby
puts "the value of 40 + 2 is #{(40 + 2)}"
```

# Question 3

Alan wrote the following method, which was intended to show all of the factors of
the input number:

```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```

Alyssa noticed that this will fail if the input is `0`, or a negative number,
and asked Alan to change the loop. How can you make this work without using
`begin/end/until`? Note that we're not looking to find the factors for 0 or negative numbers,
but we just want to handle it gracefully instead of raising an exception or going
into an infinite loop.

## Answer
Input `0`: ZeroDivisionError
Negative input: Infinite loop (divisor never becomes `0`)

Solution:
Use a regular `loop` and put the `break if` statement at the top.
This will cause the loop to break when `divisor` is at or below 0 before the
variable is used in any calculations.

```ruby
def factors(number)
  divisor = number
  factors = []
  loop do
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
```
### LS Solution
```ruby
while divisor > 0 do
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end
```

## Bonus 1
What is the purpose of the `number % divisor == 0` ?

### Answer
The `%` operator is the modulo operator which returns `0` when
`number / divisor` equals a whole number. This again is an indicator that
`number` is a factor of `divisor`.

#### LS Solution
Allows you to determine if the result of the division is an integer number (no remainder).

## Bonus 2
What is the purpose of the second-to-last line (`line 8`) in the method
(the factors before the method's end)?

### Answer
The method will return the last expression that is evaluated. The `factors`
before the method's end is there to ensure that the return value of the
method is `factors`.

#### LS Solution
This is what is the actual return value from the method. Recall that
*without an explicit `return` statement* in the code, the return value of the method is the
last statement executed. If we omitted this line, the code would execute,
but the return value of the method *would be `nil`*.


# Question 4

Alyssa was asked to write an implementation of a rolling buffer.
Elements are added to the rolling buffer and if the buffer becomes full,
then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for
modifying the buffer?". Is there a difference between the two, other than what
operator she chose to use to add an element to the buffer?

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```

## Answer
The return values of the two methods are the same, but only `rolling_buffer1`
modifies (mutates) the original `buffer`.

In `rolling_buffer1`, a copy of the reference to the buffer object is passed as
an argument and assigned to the method parameter `buffer`.
The shovel operator, `<<`, appends the new item to `buffer`, which mutates the object
referenced by `buffer`. If `buffer` exceeds `max_buffer_size`, it is again mutated
by `shift`, which removes (and returns) the first element in `buffer`.
`buffer` is then put as the last expression so it will become the return value of the method.

Method call: `rolling_buffer1(buffer, max_buffer_size, new_element)`


In `rolling_buffer2`, the copy of the buffer reference is assigned to the method
parameter `input_array` instead of `buffer`. Then, the local variable `buffer` is
initialized to the return value of `input_array + [new_element]`. The `+`
operator also appends `new_item` to its caller but does not mutate it, which means
the object pointed to by `input_array` is not changed. Similarly to above, the first
value of `buffer` is removed if `buffer` exceeds `max_buffer_size` and `buffer`
is returned.

Method call: `buffer = rolling_buffer2(buffer, max_buffer_size, new_element)`

### LS Solution
Yes, there is a difference. While both methods have the same return value, in the
first implementation, the input argument called buffer will be modified and will
end up being changed after rolling_buffer1 returns. That is, the caller will have
the input array that they pass in be different once the call returns. In the other
implementation, rolling_buffer2 will not alter the caller's input argument.


# Question 5

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
A user passes in two numbers, and the calculator will keep computing the sequence
until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it,
he got an error. Something about the limit variable. What's wrong with the code?

```ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

How would you fix this so that it works?

## Answer
Error message: `Undefined local variable or method 'limit' for main:object (NameError)`
Problem: The local variable `limit` is initialized outside of the method
definition and is therefore not accessible in the method definition's scope.

Solution 1: initialize `limit` within the method definition:

```ruby
def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
```

Solution 2: pass `limit` as an argument to the method:
```ruby
limit = 15

def fib(first_num, second_num, lim)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
```

# Question 6

What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

## Answer
34

**Explanation**
This is a demonstration of *pass by reference value* and *re-assignment*.
`answer` is referencing the object `42`, and it is a copy of this reference that is
passed when the method is called. The re-assignment within the method definition
binds the method variable `some_number` to a new value but does not change the
binding of `answer`.

**Line by line**
`Line 1`: The local variable `answer` is initialized to the Integer `42`
`Line 3`: The method parameter `some_number` is assigned a copy of the reference
held by `answer`.
`Line 4`: `some_number` is re-assigned the return value of `some_number + 8`.
Since this is the last evaluated expression in the method definition, this value is
returned from the method.
`Line 7`: The local variable `new_answer` is initialized to the return value of
the method call with `answer` passed as an argument.
`Line 9`: The method `p` is called on `answer - 8`, which will evaluate to
`42 - 8` which again evaluates to `34`.


# Question 7

One day Spot was playing with the Munster family's home computer and he wrote a
small program to mess with their demographic data:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

After writing this method, he typed the following...and before Grandpa could
stop him, he hit the Enter key with his tail:

```ruby
mess_with_demographics(munsters)
```

Did the family's data get ransacked? Why or why not?

## Answer
Yes.
A copy of the **reference to the hash object** with the data is passed to the method, which
means it's possible for the original hash to be changed from within the method.
The method uses **indexed assignment** to change the values in the hash and
this mutates the original hash object (The hash elements are re-assigned new values).

### LS Solution
**MAIN POINT: Pass by reference copy => The method has access to original hash"**

Spot will find himself in the "dog" house for this one. The family's data is all in shambles now.

Why? Remember that in Ruby, what gets passed to a method isn't the value of the object.
**Under the hood, Ruby passes the object_id of each argument to the method.**
**The method stores these object_id's internally in locally scoped (private to the method) variables**
(named per the method definition's parameter list).

So Spot's demo_hash starts off pointing to the munsters hash. His program could wind up
replacing that with some other object id and then the family's data would be safe.

In this case, **the program does not reassign demo_hash -- it just uses it as-is.**
So the actual hash object that is being messed with inside of the method IS the munsters hash.

# Question 8

Method calls can take expressions as arguments. Suppose we define a method called
rps as follows, which follows the classic rules of rock-paper-scissors game, but
with a slight twist that it declares whatever hand was used in the tie as the result of that tie.

```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```

What is the result of the following call?

```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```


## Answer
paper


# Question 9

Consider these two simple methods:

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

What would be the return value of the following method invocation?

`bar(foo)`

## Answer
no

`bar` is called with `foo` as an argument.
The return value of `foo` is the String literal `"yes"`, which is assigned the
`bar` method parameter `param`. Within `bar`, `param` now points to `"yes"`, which
means the ternary conditional expression evaluates to `false` and returns `"no"`.
