# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# How many circular primes are there below one million?


beg = Time.now

max_num = 999999

# first, find all primes under 1,000,000

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


# rotation helper methods

def rotate_str(s)
  "#{s[1..s.size-1]}#{s[0..0]}"
end

def rotations(x)
  vals = []
  str_x = x.to_s
  y = str_x
  while true
    y = rotate_str(y)
    vals << y
    break if str_x == y
  end
  vals.collect{|x| x.to_i}.uniq
end


circular_primes = {2 => 1}

for i in 3..max_num
  next if circular_primes.has_key?(i)
  next unless primes[i] == 0

  rots = rotations(i)
  circular = true
  for r in rots[0..rots.size-2]
    if primes[r] != 0
      circular = false
      break
    end
  end
  next unless circular
  for r in rots
    circular_primes[r] = 1
  end
end

puts circular_primes.size
puts (Time.now-beg)