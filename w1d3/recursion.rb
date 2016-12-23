# # Recursion Homework
#
# ## Exercise 1 - `sum_to`
#
# Write a function `sum_to(n)` that uses recursion to calculate the sum from 1 to n (inclusive of n).
#
# ```ruby
#   # Test Cases
#   sum_to(5)  # => returns 15
#   sum_to(1)  # => returns 1
#   sum_to(9)  # => returns 45
#   sum_to(-8)  # => returns nil
# ```
#

def sum_to(n)

  if n < 1
    return nil
  elsif n == 1
    return 1
  end

  n + sum_to(n - 1)
end

# ## Exercise 2 - `add_numbers`
#
# Write a function `add_numbers(nums_array)` that takes in an array of Fixnums and returns the sum of those numbers.  Write this method recursively.
#
# ```ruby
#   # Test Cases
#   add_numbers([1,2,3,4]) # => returns 10
#   add_numbers([3]) # => returns 3
#   add_numbers([-80,34,7]) # => returns -39
#   add_numbers([]) # => returns nil
# ```
#

def add_numbers(nums_array)
  return nil if nums_array.empty?
  first_elem = nums_array.first
  return first_elem if nums_array.length == 1
  first_elem + add_numbers(nums_array[1..-1])
end

# ## Exercise 3 - Gamma Function
#
# Let's write a method that will solve Gamma Function recursively.  The Gamma Function is defined `Γ(n) = (n-1)!`.
#
# ```ruby
#   # Test Cases
#   gamma_fnc(0)  # => returns nil
#   gamma_fnc(1)  # => returns 1
#   gamma_fnc(4)  # => returns 6
#   gamma_fnc(8)  # => returns 5040
# ```

def gamma_function(n)

  if n < 1
    return nil
  elsif n == 1
    return 1
  end

  (n - 1) * gamma_function(n - 1)
end
