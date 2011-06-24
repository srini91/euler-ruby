# A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

#1/2    = 	0.5
#1/3    = 	0.(3)
#1/4    = 	0.25
#1/5    = 	0.2
#1/6    = 	0.1(6)
#1/7    = 	0.(142857)
#1/8    = 	0.125
#1/9    = 	0.(1)
#1/10   = 	0.1
#Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d  1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

beg = Time.now


def get_digits(num, denom)
  return "" if num < 1
  n,d,rem = num, denom, 0

  divs_in_chain = {}
  digits = ""

  while true
    zero_padding = -1
    while n < d
      n *= 10
      zero_padding += 1
    end
    if divs_in_chain.has_key?("#{n}/#{d}")
      digits << "..."
      break
    else
      divs_in_chain["#{n}/#{d}"] = 1    
    end

    digits << ("0" * zero_padding) if zero_padding > 0
    digits << (n/d).to_s
    n %= d
    break if n == 0
  end
  digits
end

max_digits = 0
d = 1
for i in 1..999
  num_digits = get_digits(1, i)
  next unless num_digits =~ /\.\.\.$/
  if num_digits.size > max_digits
    d = i
    max_digits = num_digits.size
  end
end

puts d
puts (Time.now-beg)