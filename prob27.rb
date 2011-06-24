#Euler published the remarkable quadratic formula:

#n² + n + 41

#It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

#Using computers, the incredible formula  n²  79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, 79 and 1601, is 126479.

#Considering quadratics of the form:

#n² + an + b, where |a|  1000 and |b|  1000

#where |n| is the modulus/absolute value of n
#e.g. |11| = 11 and |4| = 4
#Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.


beg = Time.now

def is_prime(x)
  return false if x < 2
  for i in (2..Math::sqrt(x).to_i)
    return false if x % i == 0
  end
  return true
end

primes = []
(2..1000).each {|x| primes << x if is_prime(x)}

max_a = 0
max_b = 0
max_primes = 0

for a in -999..999
  for b in primes
    n = 1
    while true
      break unless is_prime(n * n + a * n + b)
      n += 1
    end
    if n > max_primes
      max_a = a
      max_b = b
      max_primes = n
    end
  end
end

puts max_a * max_b
puts (Time.now-beg)