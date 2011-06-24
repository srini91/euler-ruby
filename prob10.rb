# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

beg = Time.now

max_num = 1999999

primes = [0] * (max_num + 1)

# 0 and 1 are not primes
primes[0] = primes[1] = 1

i = 2
while i <= max_num
  j = i * 2
  while j <= max_num
    primes[j] = 1
    j += i
  end
  i += 1
  i += 1 while (i <= max_num) and (primes[i] == 1)
end

sum = 0
for i in 0..max_num
  sum += i if primes[i] == 0
end

puts sum
puts (Time.now-beg)