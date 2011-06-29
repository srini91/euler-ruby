# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39*186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

beg = Time.now


# Notes
#   digit possibilities:
#   7,1 -> 1 fail
#   6,1 -> 2 fail
#   5,1 -> 3 fail
#   4,1 -> 4 ok;  4,2 -> 3 fail
#   3,1 -> 5 fail; 3,2 -> 4 ok, 3,1 -> 5 fail
# so only need to check 4 digit numbers


def has_pandigital_divisor(x)
  sqrt_x = Math::sqrt(x)
  for i in 1..sqrt_x
    if (x % i == 0)
      return true if is_19_pandigital([x, x/i, i])
    end
  end
  return false
end

def is_19_pandigital(nums)
  s = ""
  nums.each{|n| s << n.to_s}
  return false if s.size != 9
  a = {}
  s.each_char {|c| a[c] = 1}
  return false unless a['0'].nil?
  return (a.size == 9)
end

sum = 0
for i in 1000..9999
  sum += i if has_pandigital_divisor(i)
end

puts sum
puts (Time.now-beg)