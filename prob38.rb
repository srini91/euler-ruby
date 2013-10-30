# Take the number 192 and multiply it by each of 1, 2, and 3:

# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?


beg = Time.now


def is_19_pandigital(str)
  return false unless str.size == 9
  a = {}
  str.each_char {|c| a[c] = 1}
  return false unless a['0'].nil?
  return (a.size == 9)
end


def concatted_pandigital(num)
  str = num.to_s
  mult = 1
  while true do
    mult += 1
    str << (num * mult).to_s

    int_val = str.to_i
    return int_val if is_19_pandigital(str)
    return -1 if int_val > 999999999
  end
end

max = 0
max_int = 0

for i in (90..99).to_a + (900..999).to_a + (9000..9999).to_a + (90000..99999).to_a
  xp = concatted_pandigital(i)
  if xp > max
    max = xp
    max_int = i
  end
end 

puts max
puts (Time.now-beg)