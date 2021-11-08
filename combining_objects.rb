## Combine Two Objects Into One, Summing Like Values
## Take two objects with similar key values and combine them into a new object
# summing any values that belong to the same category.

## There's a married couple, Hank and his spouse Sheila. Hank works at a
# power plant making $70,000 a year, and Sheila is a teacher making $40,000
# a year. They both earn rental income from separate rental properties,
# Hank will get $12,000 and Sheila $10,000. The new object will show their
# separate income but combine the rental income because it fits the same
# category.


## Arguments
## user1Income (Object) ⁠— an income object for user1
## user2Income (Object) ⁠— an income object for user2
## returns: A new object with like values combined
## Challenges
## They won't have the same number of key-value pairs.
## The return object must return the values ordered from lowest to highest
# so your answers can match the test answers.

def combining_values(user1Income, user2Income)
  keys_user1 = user1Income.keys
  keys_user2 = user2Income.keys
  combined = {}

    keys_user1.each do |key|
      if keys_user2.include?(key)
        combined[key] = user1Income[key] + user2Income[key]
      else
        combined[key] = user1Income[key]
      end
    end
    p combined
    keys_user2.each do |key|
      unless combined.include?(key)
        combined[key] = user2Income[key]
      end
    end
    combined
end

user1 = {
  powerPlant: 70000,
  rental: 12000
}

user2 = {
  teaching: 40000,
  rental: 10000
}

p combining_values(user1, user2)

## becomes ➞ {
##   powerPlant: 70000,
##   teaching: 40000,
##   rental: 22000   ## The rental income is added together.
## }
