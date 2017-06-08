MAX_STACK_SIZE = 200
tracer = proc do |event|
  if event == 'call' && caller_locations.length > MAX_STACK_SIZE
    fail "Probable Stack Overflow"
  end
end
set_trace_func(tracer)

def iterative_upcase(str)
  str.chars.reduce("") do |upcased_str, char|
    upcased_str << char
  end
end

def upcased_str(str)
  return str.upcase if str.length <= 1
  string[0].upcase + upcase(str[1..-1])
end

# Exercise 1 - sum_to
#
# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n
#  (inclusive of n).

def sum_to(n)
  return nil if n < 0
  return n if n <= 1
  n + sum_to(n - 1) #if n > 0
end

  # Test Cases
  p sum_to(5)  # => returns 15
  p sum_to(1)  # => returns 1
  p sum_to(9)  # => returns 45
  p sum_to(-8)  # => returns nil
# Exercise 2 - add_numbers

# Write a function add_numbers(nums_array) that takes in an array of Fixnums and
# returns the sum of those numbers. Write this method recursively.

def add_numbers(n)
  return nil if n.length == 0
  return n[0] if n.length == 1
  adder = n.pop
  adder + add_numbers(n)

end

  # Test Cases
p add_numbers([1,2,3,4]) == 10
p add_numbers([3]) == 3
p add_numbers([-80,34,7]) == -39
p add_numbers([]) == nil
# Exercise 3 - Gamma Function

# Let's write a method that will solve Gamma Function recursively. The Gamma
# Function is defined Γ(n) = (n-1)!.

def gamma_fnc(n)
  return nil if n <= 0
  return 1 if n == 1
  return 1 if n == 2
  (n - 1) * gamma_fnc(n - 1)

end
  # Test Cases
  p gamma_fnc(0)  # => returns nil
  p gamma_fnc(1)  # => returns 1
  p gamma_fnc(4)  # => returns 6
  p gamma_fnc(8)  # => returns 5040
# Exercise 4 - Ice Cream Shop
#
# Write a function ice_cream_shop(flavors, favorite) that takes in an array of
 # ice cream flavors available at the ice cream shop, as well as the user's
 # favorite ice cream flavor. Recursively find out whether or not the shop
 # offers their favorite flavor.

def ice_cream_shop(flavors, favorite)
  checker = flavors.pop
  return true if checker == favorite
  return false if flavors.length == 0
  ice_cream_shop(flavors, favorite)
end

  # Test Cases
p  ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p  ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p  ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p  ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p  ice_cream_shop([], 'honey lavender')  # => returns false
# Exercise 5 - Reverse

# Write a function reverse(string) that takes in a string and returns it reversed.

def reverse(str)
  return "" if str.length == 0
  return str[0] if str.length == 1
  str[-1] + reverse(str[0..-2])
end

  # Test Cases
  p reverse("house") # => "esuoh"
  p reverse("dog") # => "god"
  p reverse("atom") # => "mota"
  p reverse("q") # => "q"
  p reverse("id") # => "di"
  p reverse("") # => ""
