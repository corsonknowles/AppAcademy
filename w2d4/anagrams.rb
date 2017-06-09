
# time: O(n * n!)
# space: O(n * n!)
# def first_anagram?(first_string, second_string)
#   # p check = first_string.split("")
#   # perms = check.permutation { |e| e.join("")}
#   check = first_string.chars.permutation.to_a
#   p perms = check.map { |e| e.join  }
#   perms.include?(second_string)
# end
#
# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# def second_anagram?(first_string, second_string)
#   deleted = true
#
#   while deleted
#     deleted = false
#     letters_to_delete = ""
#     first_string.chars.each do |letter|
#       if second_string.include?(letter)
#         place = second_string.index(letter)
#         second_string.delete_at(place)
#         letters_to_delete += letter
#         deleted = true
#       end
#     end
#     letters_to_delete.chars.each do |letter|
#       place = first_string.index(letter)
#       first_string.delete_at(place)
#     end
#   end
#   first_string == "" && second_string.empty?
# end


def second_anagram?(first_string, second_string)
  deleted = true
  first = first_string.chars
  second = second_string.chars

  while deleted
    deleted = false
    letters_to_delete = []
    first.each do |letter|
      if second.include?(letter)
        place = second.index(letter)
        second.delete_at(place)
        letters_to_delete << letter
        deleted = true
      end
    end
    letters_to_delete.each do |letter|
      place = first.index(letter)
      first.delete_at(place)
    end
  end
  first.empty? && second.empty?
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(first_string, second_string)
  first_string.chars.sort == second_string.chars.sort
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(first_string, second_string)
  hash_count(first_string) == hash_count(second_string)
end

def hash_count(string)
  hash = Hash.new(0)
  string.chars.each do |e|
    hash[e] += 1
  end
  hash
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

def fifth_anagram?(first_string, second_string)
  hash = Hash.new(0)
  first_string.chars.each do |e|
    hash[e] += 1
  end
  second_string.chars.each do |e|
    hash[e] -= 1
  end
  hash.values.all? { |e| e.zero? }

end

p "bonus method test"
p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true
