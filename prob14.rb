# The following iterative sequence is defined for the set of positive integers:
# n --> n/2 (n is even)
# n --> 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

beg = Time.now

CHAIN_COUNTS_HASH = {1 => 1, 2=>2, 4=>3, 8=>4, 16=>5}

longest_chain, longest_chain_steps = 1, 1

for i in 1..999999
  steps = 1
  chain = i
  while chain != 1
    chain = chain % 2 == 0 ? chain/2 : (3*chain+1)
    unless CHAIN_COUNTS_HASH[chain].nil?
      steps += CHAIN_COUNTS_HASH[chain]
      break
    end
    steps += 1
  end
  CHAIN_COUNTS_HASH[i] = steps
  if steps > longest_chain_steps
    longest_chain = i
    longest_chain_steps = steps
  end
end

puts longest_chain
puts (Time.now-beg)