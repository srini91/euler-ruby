# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

# Find the sum of all numbers which are equal to the sum of the factorial of their digits.

# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

beg = Time.now

def factorial(n)
  f = 1
  for i in n.downto(2)
    f *= i
  end
  return f
end

def sum_fact_digits(x)
  sum = 0
  while x > 0
    sum += factorial(x % 10)
    x /= 10
  end
  sum
end

sum = 0
for i in 10..1000000
  sum += i if sum_fact_digits(i) == i
end

puts sum
puts (Time.now-beg)