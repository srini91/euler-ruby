# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

# 012   021   102   120   201   210

# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

beg = Time.now

# trick: there are 10! permutations; 10! = 3628800; each digit leads for one tenth
# so perms 1-362880 lead with 0, 362881-725760 lead with 1, 725761..1088640 lead with 2

available = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
answer = ""

total_perms = 10*9*8*7*6*5*4*3*2*1
wanted_perm = 1000000

while true
  num_in_bucket = total_perms / available.size
  bucket = (wanted_perm-1) / num_in_bucket

  total_perms /= available.size
  wanted_perm %= num_in_bucket

  answer << available[bucket]
  available.delete_at(bucket)
  break if available.size == 0
end


puts answer
puts (Time.now-beg)