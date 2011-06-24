# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

beg = Time.now

def digit_sum_power(x,e=5)
  s = 0
  while x > 0
    s += (x % 10)**e
    x /= 10
  end
  s
end

sum = 0
for i in 2..1000000
  sum += i if (i == digit_sum_power(i))
end

puts sum
puts (Time.now-beg)