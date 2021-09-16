
# Class and Instance Methods

Q: Locate the ruby documentation for methods `File::path` and `File#path`. How are they different?

A: Core 2.7.4 > search Class: file > Methods (left menu)...
1. `File::path` path(path) -> string
  - Class method: Called on the `File` class itself.
  - Returns the string representation of the path
  - Examples:
    - `File.path("this/is/a/file") # => "this/is/a/file"`
    - `File.path("this/is/not/a/file") # => "this/is/not/a/file"`
2. `File#path` path -> filename
  - Instance method: Called on an object (instance) of the `File` class
  - Returns the pathname used to create *file* as a string. Does not normalize the name.
  - The pathname may not point to the file corresponding to file. For instance, the pathname becomes void when the file has been moved or deleted.
  - Examples:
    - `File.new("this/is/a/file").path # => "this/is/a/file"`
    - `File.new("this/is/not/a/file").path # => Error (no such file or directory)`
  - NOTE: `File.new("file")` *opens* an existing file and returns the new file object (it does not create a new file).


The difference between the two methods is that `File::path` is a **class method** and is called on the `File` *class*, while `File#path` is an **instance method** that is called on an *object* of the `File` class.

(`File::path` will return a string that represents the `path` argument whether or not the path exists. `File#path` on the other hand will throw an error if the path does not exist since it is called on an object (instance) of the `File` class.)


Solution: Both methods can be found on the documentation page for the `File` class in the Core API section. `File::path` is a class method, while `File#path` is an instance method.


# Optional Arguments Redux*

*brought back, revived

## Answer

**Documentation**
`Date` is a class in the Ruby **Standard Library** and is included in the `date` package. Since it's not in the Core library it has to be loaded using `require` to become available.

`::civil` is a `Date` class method which creates a date object denoting the given calendar date of the form YYYY-mm-dd. It defaults to -4712-01-01 but takes **optional arguments**: year, month, mday, and start (see solution comment!).

**Answer**

```ruby
require 'date' # Load Date module

puts Date.civil
# => -4712-01-01
puts Date.civil(2016)
# => 2016-01-01
puts Date.civil(2016, 5)
# => 2016-05-01
puts Date.civil(2016, 5, 13)
# => 2016-05-13
```

> NOTE! The point of the exercise is **optional arguments.**


## Solution comment:

Note that the **brackets are nested** with this method; **items inside the outermost bracket pairs can only be omitted if all of the innermost bracket pairs are omitted as well.**

mday = day of month

From [Wikipedia](https://en.m.wikipedia.org/wiki/Julian_day):

The **Julian day** is the continuous count of days since the beginning of the Julian period, and is used primarily by [astronomers](https://en.m.wikipedia.org/wiki/Astronomy), and in [software](https://en.m.wikipedia.org/wiki/Software) for easily calculating elapsed days between two events (e.g. food production date and sell by date).[[1]](http://localhost:6571/reader-mode/page?url=https://en.m.wikipedia.org/wiki/Julian_day&uuidkey=8417A9F3-91AF-4864-8063-D7944043BC9C#cite_note-1)

The **Julian day number** (JDN) is the integer assigned to a whole solar day in the Julian day count starting from noon [Universal time](https://en.m.wikipedia.org/wiki/Universal_time), with Julian day number 0 assigned to the day starting at noon on Monday, January 1, [4713 BC](https://en.m.wikipedia.org/wiki/4713_BC), [proleptic Julian calendar](https://en.m.wikipedia.org/wiki/Proleptic_Julian_calendar)


# Default Arguments in the middle
Use the ruby documentation to determine what this code will print.

## Answer
Before looking at any documentation:
The first and second arguments are not optional, so the first and last parameters must be assigned the first and last values provided: `a = 4` and `d = 6`. That leaves only one value for the middle two parameters with optional arguments, and the value must be assigned to the first of these: `b = 5`. The last parameter will take the default value of `c = 3` as there are no arguments left to assign. The program will therefore output `[4, 5, 3, 6]`.

**Documentation**
https://ruby-doc.com/core-2.7.0/doc/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments

Confirms my explanation.

```ruby
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
# => [4, 5, 3, 6]
```


# Mandatory Blocks
The Array#bsearch method is used to search ordered Arrays more quickly than #find and #select can. Assume you have the following code:

`a = [1, 4, 8, 11, 15, 19]`

How would you search this Array to find the first element whose value exceeds 8?

## Answer
Look up `Array#bsearch`: On the Core API documentation page, search Classes and select `class::Array`, then select `#bsearch` in left menu (or search Methods and select `# bsearch (Array)`)

The `Array#bsearch` method takes a block as an argument (required) and returns one element of the calling array depending on the return value of the block. The block takes one argument and returns `true` or `false` (in find minimum mode) based on a condition within the block.

To find the first element whose value exceeds 8 I can use #bsearch in "find minimum" mode. This will return the first element that satisfies the condition within the block. Here, the condition is `element > 8`, which will return `11`.

```ruby
a = [1, 4, 8, 11, 15, 19]

a.bsearch { |x| x > 8 }
# => 11
```
