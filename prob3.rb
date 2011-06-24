# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

beg = Time.now

num = 600851475143

def is_prime(x)
  for i in (2..Math::sqrt(x).to_i)
    return false if x % i == 0
  end
  return true
end

i = 3
max = 0
while i <= Math::sqrt(num).to_i
  max = i if ((num % i == 0) and is_prime(i))
  i += 2
end

puts max
puts (Time.now-beg)