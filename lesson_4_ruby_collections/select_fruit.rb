produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' =>  'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  fruit = {}
  keys = produce.keys
  i = 0
  loop do
    if produce[keys[i]] == 'Fruit'
      fruit[keys[i]] = 'Fruit'
    end
      i += 1
    break if i >= produce.length
  end
  fruit
end


p select_fruit(produce)
p select_fruit({})
