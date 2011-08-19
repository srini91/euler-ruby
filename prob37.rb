# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

beg = Time.now

def is_prime(x)
  return false if x < 2
  for i in (2..Math::sqrt(x).to_i)
    return false if x % i == 0
  end
  return true
end

def is_prime_truncatable(x)
  s = x.to_s
  while s.size > 0
    return false unless is_prime(s.to_i)
    s = s[1..s.size-1]    
  end
  s = x.to_s.chop
  while s.size > 0
    return false unless is_prime(s.to_i)
    s.chop!
  end
  return true
end

sum = 0
i = 10
num_found = 0

while true
  if is_prime_truncatable(i)
    sum += i
    num_found += 1
  end
  break if num_found == 11
  i += 1
end

puts sum
puts (Time.now-beg)