# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025-385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

beg = Time.now

sum_of_squares = 0
(1..100).each{|x| sum_of_squares += x*x}

square_of_sum = 0
(1..100).each{|x| square_of_sum += x}
square_of_sum = square_of_sum * square_of_sum

puts (sum_of_squares - square_of_sum).abs
puts (Time.now-beg)