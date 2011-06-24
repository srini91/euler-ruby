# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?

beg = Time.now

sum = 0
x = 2**1000

while x > 0
  sum += x % 10
  x /= 10
end

puts sum

puts (Time.now-beg)