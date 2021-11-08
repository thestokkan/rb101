# 1. Initialize an empty array 'sections'
# 2. If the array length is 0 or 1, add the current word
# 3. If the 'sections' array length is equal to 2, compare the words
# 4. If the words are not equal, remove the first word
# 5. Repeat
# If the next string word is equal to the last word in 'sections', add it to the
# 'sections' array



def count_adjacent_words(string)
  sections = []
  count = 0
  words = string.split
  i = 0

  loop do
    break if i >= words.size
    current_word = words[i].downcase
    if sections.empty? || sections.include?(current_word)
      sections << current_word
    else
      count += 1 if sections.size > 1
      sections = []
      sections << current_word
    end
     i += 1
   end
   count += 1 if sections.size > 1
   count
end

p count_adjacent_words('orange Orange apple appLe banana') == 2
p count_adjacent_words('orange Orange ORange') == 1
p count_adjacent_words('orange Orange apple appLe banana BanaNa') == 3
p count_adjacent_words('') == 0
p count_adjacent_words('orange') == 0
p count_adjacent_words('orange Orange orange apple appLe banana BanaNa') == 3
