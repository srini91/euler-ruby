# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.


beg = Time.now

def get_proper_divisor_sum(x)
  return 0 if x <= 1
  sum = 1

  sqrt_x = Math::sqrt(x)
  for i in 2..sqrt_x
    if (x % i == 0)
      sum += i
      sum += (x/i) unless (i == sqrt_x)
    end
  end
  return sum
end

divisor_sums = []
for i in 0..9999
  divisor_sums << get_proper_divisor_sum(i)
end

amicable_pairs = {}

for i in 0..9999
  if divisor_sums[i] < 10000
    if divisor_sums[divisor_sums[i]] == i
      amicable_pairs[i] = divisor_sums[i] unless (i == divisor_sums[i])
    end
  end
end

sum = 0
amicable_pairs.keys.each{|k| sum += k}
puts sum

puts (Time.now-beg)