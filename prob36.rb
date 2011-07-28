# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include leading zeros.)

beg = Time.now

def to_binary(x)
  str = ""
  while x > 0
    str << (x % 2).to_s
    x /= 2
  end
  str.reverse
end

def is_palindrome(x)
  s = x.to_s
  while s.size > 1
    return false if s[0] != s[s.size-1]
    s = s[1..(s.size-2)]
  end
  return true
end

sum = 0
for i in 1..999999
  next unless is_palindrome(i)
  next unless is_palindrome(to_binary(i))
  sum += i
end

puts sum
puts (Time.now-beg)