# The Fibonacci sequence is defined by the recurrence relation:

# Fn = Fn-1 + Fn-2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:

# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.

# What is the first term in the Fibonacci sequence to contain 1000 digits?

beg = Time.now

def num_digits(x, start_digits=0)
  num = 0
  if start_digits > 0
    x /= (10 ** start_digits)
    num += start_digits
  end
  while x > 0
    x /= 10
    num += 1
  end
  num
end

f1 = 1
f2 = 1
cur_digits = 1

term = 2

while true
  temp = f1
  f1 = f2
  f2 = temp + f2
  term += 1

  cur_digits = num_digits(f2, cur_digits)
  break if cur_digits == 1000
end

puts term
puts (Time.now-beg)