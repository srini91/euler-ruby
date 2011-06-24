# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# notes
# a^2 = c^2 - b^2
# a = 1000 - b - c
# sqrt(c^2 - b^2) = 1000 - b - c

beg = Time.now

a,b,c = 0, 0
for i in 1..1000
  for j in 1..(i-1)
    if Math::sqrt(i*i - j*j) == (1000 - i -j)
      b,c = i,j
      a = 1000 - b - c
      break if a*a == (b*b + c*c)
    end
  end
end

puts a*b*c
puts (Time.now-beg)