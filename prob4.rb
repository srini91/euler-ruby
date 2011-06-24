# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.

beg = Time.now

max = 0

def is_palindrome(x)
  s = x.to_s
  while s.size > 1
    return false if s[0] != s[s.size-1]
    s = s[1..(s.size-2)]
  end
  return true
end

999.downto(100) { |i|
  999.downto(100) {|j|
    prod = i * j
    if is_palindrome(prod)
      max = prod if prod > max
      break
    end
  }
}

puts max
puts (Time.now-beg)