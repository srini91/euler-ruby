# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:

# 1£1 + 150p + 220p + 15p + 12p + 31p
# How many different ways can £2 be made using any number of coins?

beg = Time.now

COINS = [1,2,5,10,20,50,100,200]

x = {}
COINS.each {|c| x[c] = 0}


# notes: we just need counts, so am just using counts
# you can uncomment ways below to get actual solutions, but need lots of memory

ways = [[x]] + [[]] * 200
counts = [1] + [0] * 200

for c in COINS
  for i in c..200
    counts[i] += counts[i-c]

#    solution_hashes = ways[i-c]
#    for s in solution_hashes
#      s2 = s.clone
#      s2[c] += 1
#      ways[i] += [s2]
#    end
  end
end

#puts ways[200].size
puts counts[200]
puts (Time.now-beg)