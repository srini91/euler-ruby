# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10001st prime number?

beg = Time.now

def is_prime(x)
  for i in (2..Math::sqrt(x).to_i)
    return false if x % i == 0
  end
  return true
end

primes = [2]
i = 3
while primes.size < 10001
  primes << i if is_prime(i)
  i += 2
end

puts primes.last
puts (Time.now-beg)