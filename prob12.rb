# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

# 1: 1
# 3: 1,3
# 6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.

# What is the value of the first triangle number to have over five hundred divisors?

beg = Time.now

def triangle(n)
  (n * n+1) / 2
end

def get_divisor_count(x)
  count = 2
  sqrt_x = Math::sqrt(x)
  for i in 2..sqrt_x
    count += 2 if (x % i == 0)
  end
  count -= 1 if sqrt_x == sqrt_x.to_i
  return count
end

t = 0
i = 1

while true
  t += i
  break if get_divisor_count(t) > 500
  i += 1
end

puts t
puts (Time.now-beg)