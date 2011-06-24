# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# notes on divisibility
# 1-5 -- skip, since 6, 8, 10 will handle div check
# 6-10 -- skip, since 12, 14, 16, 18, 20 will handle div check
# start with 2520, go in increments of 2520 (since div by 10 is given)

beg = Time.now

ans = 0

def is_divisible_by_range(num, range)
  for i in range
    return false if num % i != 0
  end
  return true
end

while true
  ans += 2520
  break if is_divisible_by_range(ans, 11..20)
end

puts ans
puts (Time.now-beg)