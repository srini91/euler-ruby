# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.


beg = Time.now

MAX_NUM = 28123

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

abundant_numbers = {}
for i in 1..MAX_NUM
  if get_proper_divisor_sum(i) > i
    abundant_numbers[i] = 1
  end
end

sum_of_abundant_numbers = [0]*(MAX_NUM+1)

for i in 0..MAX_NUM
  next unless abundant_numbers[i] == 1
  for j in i..(MAX_NUM-i)
    next unless abundant_numbers[j] == 1
    sum_of_abundant_numbers[i+j] = 1
  end
end

sum = 0
for i in 0..28123
  sum += i if sum_of_abundant_numbers[i] == 0
end
puts sum

puts (Time.now-beg)